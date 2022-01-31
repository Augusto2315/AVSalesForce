import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:salesforce/controllers/widgetControllers/menu_controller.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
    required this.title,
    required this.children,
    required this.icon,
  }) : super(key: key);

  final String title;
  final List<Widget> children;
  final IconData icon;
  final bool active = false;

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;
    MenuController controller = Get.put(MenuController());

    return GetBuilder<MenuController>(builder: (_) {
      return ExpansionTile(
        title: Text(title),
        children: children,
        trailing: getTrailing(context, controller),
        leading: Icon(
          icon,
          color: scheme.secondaryVariant,
        ),
        onExpansionChanged: (expanse) => {controller.menuClick()},
      );
    });
  }

  Widget? getTrailing(BuildContext context, MenuController controller) {
    if (!controller.menuActive) {
      return Icon(Icons.arrow_drop_down_outlined,
          color: Theme.of(context).colorScheme.primary);
    } else {
      return Icon(Icons.arrow_drop_up_outlined,
          color: Theme.of(context).colorScheme.primary);
    }
  }
}
