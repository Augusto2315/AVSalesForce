import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DropdownController extends GetxController {
  String? _valor;

  void setValor(String? selecao) {
    _valor = selecao;
    update();
  }

  String? getValor() {
    return _valor;
  }
}
