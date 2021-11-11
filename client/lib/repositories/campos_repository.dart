import '../models/campos.dart';

class CamposRepositories {
  List<ConfiguracaoCampos> getCampos() {
    List<ConfiguracaoCampos> configCampos = [];
    ConfiguracaoCampos campo =
        ConfiguracaoCampos(1, "Teste", "Orçamento", true);
    configCampos.add(campo);
    return configCampos;
  }
}
