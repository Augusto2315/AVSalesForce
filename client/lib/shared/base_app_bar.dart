import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesforce/controllers/widgetControllers/grupo_controller.dart';
import 'package:salesforce/widgets/Menu/drawer_item.dart';
import 'package:salesforce/widgets/Menu/drawer_menu.dart';

class BaseAppBarWidget extends StatelessWidget {
  final AppBar appBar;
  final Widget body;
  final String routeSelected;

  final GrupoController controller = Get.put(GrupoController());

  BaseAppBarWidget(
      {Key? key,
      required,
      required this.appBar,
      required this.body,
      required this.routeSelected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: appBar,
      drawer: Drawer(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountEmail: const Text("augusto.cesar.de.assis@gmail.com"),
              accountName: const Text("Augusto Cesar de Assis"),
              currentAccountPicture: CircleAvatar(
                child: const Text("AA"),
                backgroundColor: scheme.primary,
              ),
            ),
            const DrawerItem(
              icon: Icons.home,
              text: 'Início',
              route: '/',
            ),
            const MenuDrawer(
              icon: Icons.settings,
              title: 'Configurações',
              children: [
                DrawerItem(
                  icon: Icons.settings_applications,
                  text: 'Configurações de Acesso',
                  route: '/configuracao-acessos',
                ),
              ],
            )
          ],
        ),
      ),
      body: body,
    );
  }
}
