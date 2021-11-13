import 'package:flutter/material.dart';
import 'package:salesforce/widgets/drawer_item.dart';

// ignore: must_be_immutable
class BaseAppBarWidget extends StatefulWidget {
  final AppBar appBar;
  final Widget body;
  String routeSelected = '';
  String expandedRoute = '';
  bool forceExpanded = false;

  BaseAppBarWidget(
      {Key? key,
      required,
      required this.appBar,
      required this.body,
      required this.routeSelected})
      : super(key: key);

  @override
  State<BaseAppBarWidget> createState() => _BaseAppBarState();
}

class _BaseAppBarState extends State<BaseAppBarWidget> {
  final Color backgroundColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      drawer: Drawer(
        child: ListView(
          // physics: ClampingScrollPhysics(),
          // shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountEmail: Text("augusto.cesar.de.assis@gmail.com"),
              accountName: Text("Augusto Cesar de Assis"),
              currentAccountPicture: CircleAvatar(child: Text("AA")),
            ),
            DrawerItem(
              icon: Icons.account_circle,
              text: 'Cadastros',
              route: '/cadastro',
              actualRoute: widget.routeSelected,
              isChildren: false,
              hasChildren: false,
            ),
            DrawerItem(
              icon: Icons.attach_money,
              text: 'Movimentos',
              route: '/movimentos',
              actualRoute: widget.routeSelected,
              isChildren: false,
              hasChildren: false,
            ),
            DrawerItem(
                icon: Icons.settings,
                text: 'Configurações',
                route: '/configuracoes',
                actualRoute: widget.routeSelected,
                isChildren: false,
                hasChildren: true,
                onTap: () {
                  setState(() {
                    if (widget.expandedRoute.contains('/configuracoes')) {
                      widget.expandedRoute = '';
                      widget.forceExpanded = false;
                    } else {
                      widget.expandedRoute = '/configuracoes';
                      widget.forceExpanded = true;
                    }
                  });
                }),
            DrawerItem(
              icon: Icons.settings_applications,
              text: 'Configurações De Campos',
              route: '/configuracoes/configuracao-campos',
              expanded: ('/configuracoes/configuracao-campos'
                              .contains(widget.expandedRoute) &&
                          widget.expandedRoute.isNotEmpty ||
                      widget.routeSelected ==
                          '/configuracoes/configuracao-campos') ||
                  widget.forceExpanded,
              actualRoute: widget.routeSelected,
              isChildren: true,
              hasChildren: false,
            ),
          ],
        ),
      ),
      body: widget.body,
    );
  }
}
