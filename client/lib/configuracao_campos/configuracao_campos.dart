import 'package:flutter/material.dart';
import 'package:salesforce/configuracao_campos/configuracao_campos_grid/configuracao_campos_grid.dart';
import 'package:salesforce/repositories/campos_repository.dart';

class ConfiguracaoCamposWidget extends StatelessWidget {
  const ConfiguracaoCamposWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuração de campos'),
      ),
      body: const ConfiguracaoCamposWidget(),
    );
  }
}
