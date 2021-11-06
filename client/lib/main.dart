import 'package:flutter/material.dart';
import 'package:salesforce/widgets/drawer_item.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(const MyApp());
}

/// The application that contains datagrid on it.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AV Sales Force',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

/// The home page of the application which hosts the datagrid.
class MyHomePage extends StatefulWidget {
  /// Creates the home page.
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
      ),
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
              onTap: () => {Navigator.pop(context)},
            ),
            DrawerItem(
              icon: Icons.attach_money,
              text: 'Movimentos',
              onTap: () => {Navigator.pop(context)},
            ),
            DrawerItem(
              icon: Icons.settings,
              text: 'Configurações',
              onTap: () => {Navigator.pop(context)},
            ),
          ],
        ),
      ),
      body: const Center(
        child: Text("Av Sales Force"),
      ),
    );
  }

  // Widget _createDrawerItem(
  //     {required IconData icon,
  //     required String text,
  //     required GestureTapCallback onTap}) {
  //   return ListTile(
  //     title: Row(
  //       children: <Widget>[
  //         Icon(icon),
  //         Padding(
  //           padding: const EdgeInsets.only(left: 8.0),
  //           child: Text(text),
  //         )
  //       ],
  //     ),
  //     trailing: const Icon(Icons.arrow_drop_down_outlined),
  //     onTap: onTap,
  //   );
  // }
}
