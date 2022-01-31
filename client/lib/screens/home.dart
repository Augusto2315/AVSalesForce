import 'package:flutter/material.dart';
import 'package:salesforce/shared/base_app_bar.dart';

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseAppBarWidget(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: const Text("Bem Vindo"),
      routeSelected: '/',
    );
  }
}
