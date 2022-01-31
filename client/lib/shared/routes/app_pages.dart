import 'package:get/get.dart';
import 'package:salesforce/main.dart';
import 'package:salesforce/screens/config_acessos/configuracao_padrao.dart';
part './routes.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: Routes.INITIAL,
      page: () => const Home(),
    ),
    GetPage(
      name: Routes.ACESSOS,
      page: () => const ConfiguracaoPadraoWidget(),
    ),
  ];
}
