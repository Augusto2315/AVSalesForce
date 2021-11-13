import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DrawerItem extends StatefulWidget {
  late IconData icon = Icons.ac_unit;
  late String text = '';
  late String route = '';
  late String actualRoute = '';
  late bool expanded;
  late String expandedRoute = '';
  late bool isChildren;
  late bool hasChildren;
  late String originalRoute = actualRoute;
  Function()? onTap;

  DrawerItem({
    Key? key,
    required this.icon,
    required this.text,
    required this.route,
    required this.actualRoute,
    required this.hasChildren,
    required this.isChildren,
    this.expandedRoute = '',
    this.onTap,
    this.expanded = false,
  }) : super(key: key);

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: widget.expanded ||
          widget.hasChildren ||
          (!widget.isChildren && !widget.hasChildren),
      child: ListTile(
        title: Row(
          children: getWidgetAsListTileItem(
              widget.icon,
              widget.route == widget.actualRoute ||
                      widget.route == widget.originalRoute
                  ? Colors.red
                  : Colors.blue,
              widget.text,
              widget.isChildren ? 24.0 : 8.0),
        ),
        trailing: getTrailing(),
        selected: widget.route == widget.actualRoute,
        onTap: widget.onTap ?? () => {goToRoute()},
      ),
    );
  }

  List<Widget> getWidgetAsListTileItem(
      IconData icon, Color cor, String text, double margem) {
    return <Widget>[
      Padding(
        padding: EdgeInsets.only(left: margem),
        child: Icon(
          icon,
          color: cor,
        ),
      ),
      Text(text),
    ];
  }

  void goToRoute() {
    debugPrint(widget.originalRoute);
    if (widget.originalRoute != widget.route && !widget.hasChildren) {
      Navigator.pushNamed(context, widget.route);
    } else if (widget.hasChildren) {
      widget.expanded = true;
    }
  }

  Widget? getTrailing() {
    if (widget.hasChildren) {
      if (widget.actualRoute != widget.route &&
          widget.actualRoute.contains(widget.route)) {
        return const Icon(Icons.arrow_drop_up_outlined, color: Colors.blue);
      } else {
        return const Icon(Icons.arrow_drop_down_outlined, color: Colors.blue);
      }
    }
    return null;
  }
}
