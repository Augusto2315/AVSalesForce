import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String route;

  const DrawerItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ColorScheme scheme = Theme.of(context).colorScheme;

    return ListTile(
      onTap: goToRoute,
      title: Row(
        children: <Widget>[
          Icon(
            icon,
            color: scheme.secondaryVariant,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }

  void goToRoute() {
    Get.toNamed(route);
  }
}
