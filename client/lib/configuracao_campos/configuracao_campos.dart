import 'package:flutter/material.dart';
import 'package:salesforce/configuracao_campos/configuracao_campos_grid/configuracao_campos_grid.dart';
import 'package:salesforce/shared/base_app_bar.dart';

class ConfiguracaoCamposWidget extends StatelessWidget {
  const ConfiguracaoCamposWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAppBarWidget(
      routeSelected: '/configuracoes/configuracao-campos',
      appBar: AppBar(
        title: const Text('Configuração de campos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const Expanded(child: ConfiguracaoCamposGridWidget()),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () => {},
                  child: const Text('Salvar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
