import 'package:flutter/material.dart';
import 'package:salesforce/configuracao_campos/configuracao_campos.dart';
import 'package:salesforce/shared/base_app_bar.dart';

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
      routes: {
        '/configuracoes/configuracao-campos': (context) =>
            const ConfiguracaoCamposWidget(),
      },
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
    return BaseAppBarWidget(
      routeSelected: '/main',
      appBar: AppBar(
        title: const Text('Syncfusion Flutter DataGrid'),
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
