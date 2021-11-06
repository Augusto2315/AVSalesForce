import 'package:flutter/material.dart';

class DrawerItem extends StatefulWidget {
  late IconData icon = Icons.ac_unit;
  late String text = '';
  late GestureTapCallback? onTap = null;

  DrawerItem({
    Key? key,
    required IconData icon,
    required String text,
    required GestureTapCallback onTap,
  }) : super(key: key);

  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        children: <Widget>[
          Icon(widget.icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(widget.text),
          )
        ],
      ),
      trailing: const Icon(Icons.arrow_drop_down_outlined),
      onTap: widget.onTap,
    );
  }
}
