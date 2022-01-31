import 'package:flutter/material.dart';
import 'package:salesforce/shared/base_app_bar.dart';

import 'grupos/grupos.dart';
import 'usuarios/usuarios.dart';

class ConfiguracaoPadraoWidget extends StatefulWidget {
  const ConfiguracaoPadraoWidget({Key? key}) : super(key: key);

  @override
  _ConfiguracaoPadraoWidgetState createState() =>
      _ConfiguracaoPadraoWidgetState();
}

class _ConfiguracaoPadraoWidgetState extends State<ConfiguracaoPadraoWidget> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BaseAppBarWidget(
        routeSelected: '/configuracao-acessos',
        appBar: AppBar(
          title: const Text('Configurações de Acesso'),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.group),
                text: "Grupos",
              ),
              Tab(
                icon: Icon(Icons.account_circle),
                text: "Usuários",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const GruposWidget(),
            UsuariosWidget(),
          ],
        ),
      ),
    );
  }
}
