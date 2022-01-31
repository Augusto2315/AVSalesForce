import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:salesforce/models/config_acessos/grupo.dart';

class GrupoController extends GetxController {
  List<Grupo> grupos = [];
  Grupo? grupoSelecionado = null.obs();

  void setList(List<Grupo> groups) {
    grupos = groups;
    update();
  }

  void removeGroup(Grupo grupo) {
    grupos.remove(grupo);
    update();
  }

  void setSelecionado(Grupo? grupo) {
    grupoSelecionado = grupo;
    // update();
  }
}
