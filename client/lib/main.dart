import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:salesforce/screens/home.dart';
import 'package:salesforce/shared/routes/app_pages.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'AV Sales Force',
      theme: ThemeData(
        fontFamily: 'Roboto',
        applyElevationOverlayColor: true,
        primaryColor: const Color.fromARGB(255, 91, 95, 151),
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          background: const Color.fromARGB(255, 255, 255, 251),
          onBackground: Colors.black,
          primary: const Color.fromARGB(255, 91, 95, 151),
          onPrimary: Colors.white,
          secondary: Colors.orangeAccent,
          onSecondary: Colors.white,
          primaryVariant: const Color.fromARGB(255, 184, 184, 209),
          surface: const Color.fromARGB(255, 184, 184, 209),
          onSurface: Colors.black,
          secondaryVariant: Colors.indigo.shade200,
          error: const Color.fromARGB(255, 255, 139, 140),
          onError: const Color.fromARGB(255, 255, 255, 251),
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: AppPages.routes,
      home: const HomeWidget(),
    );
  }
}
