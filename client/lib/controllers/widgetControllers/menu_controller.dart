import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MenuController extends GetxController {
  bool menuActive = false;

  void menuClick() {
    menuActive = !menuActive;
    update();
  }
}
