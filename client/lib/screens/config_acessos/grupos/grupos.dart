import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesforce/controllers/widgetControllers/grupo_controller.dart';
import 'package:salesforce/models/config_acessos/grupo.dart';
import 'package:salesforce/repositories/grupo_repository.dart';
import 'package:salesforce/widgets/Buttons/button_find.dart';
import 'package:salesforce/widgets/Buttons/button_save.dart';
import 'package:salesforce/widgets/Fields/text_field.dart';
import 'package:salesforce/widgets/Utils/confirm_dialog.dart';
import 'package:salesforce/widgets/Utils/sucess_message.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:syncfusion_flutter_core/theme.dart';

class GruposWidget extends StatefulWidget {
  const GruposWidget({Key? key}) : super(key: key);

  @override
  _GruposWidgetState createState() => _GruposWidgetState();
}

List<Grupo> listaGrupos = [];

class _GruposWidgetState extends State<GruposWidget> {
  final TextEditingController nomeGrupoController = TextEditingController();

  late GruposDataSource _groupDataSource;
  final GrupoRepositories grupoRep = GrupoRepositories();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) => SingleChildScrollView(
        child: Column(
          children: [
            CustomTextField(
              controller: nomeGrupoController,
              inputType: TextInputType.text,
              hint: "Informe o Nome do Grupo",
              label: "Nome do Grupo",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ButtonSave(
                  onClick: salvarGrupo,
                ),
                ButtonFind(
                  onClick: carregarGrupos,
                ),
              ],
            ),
            FutureBuilder(
              future: grupoRep.getGrupos(),
              builder:
                  (BuildContext context, AsyncSnapshot<List<Grupo>> snapshot) {
                List<Widget> children;
                if (snapshot.hasData) {
                  _groupDataSource = GruposDataSource(
                    grupos: snapshot.data!,
                    context: context,
                  );
                  children = <Widget>[
                    SfDataGridTheme(
                      data: SfDataGridThemeData(
                        sortIconColor: Theme.of(context).colorScheme.primary,
                      ),
                      child: SizedBox(
                        height: constraints.maxHeight * 0.8,
                        child: SfDataGrid(
                          isScrollbarAlwaysShown: true,
                          allowSorting: true,
                          columns: getColumns(),
                          source: _groupDataSource,
                          columnWidthMode: ColumnWidthMode.fitByCellValue,
                        ),
                      ),
                    ),
                  ];
                } else {
                  children = const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Carregando...'),
                    )
                  ];
                }
                return Column(
                  children: children,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  List<GridColumn> getColumns() {
    List<GridColumn> columns;
    columns = <GridColumn>[
      getGridColumn('excluir', '', 180),
      getGridColumn('codGrupo', 'Código do Grupo', 150),
      getGridColumn('nomeGrupo', 'Nome do Grupo', 250),
    ];
    return columns;
  }

  GridColumn getGridColumn(String nome, String texto, double width) {
    return GridColumn(
      columnName: nome,
      width: width,
      label: Container(
        padding: const EdgeInsets.all(8),
        alignment: Alignment.centerRight,
        child: Text(
          texto,
          overflow: TextOverflow.fade,
        ),
      ),
    );
  }

  void salvarGrupo() {
    final String nomeGrupo = nomeGrupoController.text;

    Grupo gp = Grupo(
      codEmpresa: 1,
      codGrupo: 0,
      nomeGrupo: nomeGrupo,
    );

    grupoRep.saveGrupo(gp).then(
          (grupo) => {
            const SucessMessage(mensagem: "Grupo Salvo com sucesso!").show(),
            nomeGrupoController.text = "",
            carregarGrupos(),
          },
        );
  }

  void carregarGrupos() {
    setState(
      () {
        grupoRep.getGrupos().then(
              (grupos) => {
                _groupDataSource = GruposDataSource(
                  grupos: grupos,
                  context: context,
                ),
              },
            );
      },
    );
  }
}

class GruposDataSource extends DataGridSource {
  final BuildContext context;

  GrupoController controller = Get.find();

  GruposDataSource({required List<Grupo> grupos, required this.context}) {
    controller.setList(grupos);
    _grupos = controller.grupos
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<Widget>(
                columnName: 'excluir',
                value: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () => editarGrupo(e),
                      child: Row(
                        children: const [
                          Text("Editar"),
                          Icon(
                            Icons.edit,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        primary: Theme.of(context).colorScheme.error,
                      ),
                      onPressed: () => excluirGrupo(e),
                      child: Row(
                        children: const [
                          Text("Excluir"),
                          Icon(
                            Icons.delete,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              DataGridCell<int>(columnName: 'codGrupo', value: e.codGrupo),
              DataGridCell<String>(columnName: 'nomeGrupo', value: e.nomeGrupo),
            ]))
        .toList();
  }

  List<DataGridRow> _grupos = [];

  @override
  List<DataGridRow> get rows => _grupos.obs;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return getColumnChild(dataGridCell, row);
    }).toList());
  }

  Widget getColumnChild(DataGridCell<dynamic> coluna, DataGridRow row) {
    if (coluna.columnName == "excluir") {
      return coluna.value;
    } else {
      return Text(coluna.value.toString());
    }
  }

  void excluir(Grupo grupo) {
    final GrupoRepositories grupoRep = GrupoRepositories();
    grupoRep.delete(grupo).then(
          (value) =>
              const SucessMessage(mensagem: "Grupo Removido com sucesso!")
                  .show(),
        );
    controller.removeGroup(grupo);

    Get.back(result: true);
  }

  excluirGrupo(Grupo e) {
    Get.dialog(
      ConfirmDialog(
        onConfirm: () => excluir(e),
        onDeny: () => Get.back(result: false),
      ),
    );
  }

  editarGrupo(Grupo e) {}
}
