import 'package:flutter/material.dart';
import 'package:salesforce/repositories/campos_repository.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import '../../../models/campos.dart';

class ConfiguracaoCamposGridWidget extends StatefulWidget {
  const ConfiguracaoCamposGridWidget({Key? key}) : super(key: key);

  @override
  State<ConfiguracaoCamposGridWidget> createState() =>
      _ConfiguracaoCamposGridWidgetState();
}

List<ConfiguracaoCampos> listaCampos = [];

class _ConfiguracaoCamposGridWidgetState
    extends State<ConfiguracaoCamposGridWidget> {
  late ConfiguracaoCamposDataSource _employeeDataSource;

  @override
  void initState() {
    super.initState();
    listaCampos = CamposRepositories().getCampos();
    _employeeDataSource = ConfiguracaoCamposDataSource(campos: listaCampos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SfDataGrid(
        source: _employeeDataSource,
        columns: [
          GridColumn(
              columnName: 'campo',
              label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerRight,
                  child: const Text(
                    'Campo',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'tela',
              label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Tela',
                    overflow: TextOverflow.ellipsis,
                  ))),
          GridColumn(
              columnName: 'visivel',
              label: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    'Visivel',
                    overflow: TextOverflow.ellipsis,
                  ))),
        ],
      ),
    );
  }
}

@override
List<DataGridRow> dataGridRows = [];

class ConfiguracaoCamposDataSource extends DataGridSource {
  ConfiguracaoCamposDataSource({required List<ConfiguracaoCampos> campos}) {
    _employees = campos
        .map<DataGridRow>((e) => DataGridRow(cells: [
              DataGridCell<String>(columnName: 'campo', value: e.campo),
              DataGridCell<String>(columnName: 'tela', value: e.tela),
              DataGridCell<bool>(columnName: 'visivel', value: e.visivel),
            ]))
        .toList();
  }

  List<DataGridRow> _employees = [];

  @override
  List<DataGridRow> get rows => _employees;

  @override
  DataGridRowAdapter? buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((dataGridCell) {
      return Container(
        alignment: (dataGridCell.columnName == 'campo')
            ? Alignment.centerRight
            : Alignment.centerLeft,
        padding: const EdgeInsets.all(16.0),
        child: getColumnChild(dataGridCell, row),
      );
    }).toList());
  }

  Widget getColumnChild(DataGridCell<dynamic> coluna, DataGridRow row) {
    if (coluna.columnName == 'visivel') {
      return Checkbox(
        value: row.getCells()[2].value,
        onChanged: (value) {
          final index = rows.indexOf(row);
          listaCampos[index].visivel = value!;
          row.getCells()[2] = DataGridCell(value: value, columnName: 'visivel');
          notifyDataSourceListeners(rowColumnIndex: RowColumnIndex(index, 2));
        },
      );
    } else {
      return Text(coluna.value.toString());
    }
  }
}
