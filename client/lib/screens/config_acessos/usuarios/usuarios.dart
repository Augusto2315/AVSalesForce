import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:salesforce/controllers/widgetControllers/dropdown_controller.dart';
import 'package:salesforce/controllers/widgetControllers/grupo_controller.dart';
import 'package:salesforce/models/config_acessos/grupo.dart';
import 'package:salesforce/widgets/Buttons/button_save.dart';
import 'package:salesforce/widgets/Fields/dowdown_field.dart';
import 'package:salesforce/widgets/Fields/password_field.dart';
import 'package:salesforce/widgets/Fields/text_field.dart';

class UsuariosWidget extends StatelessWidget {
  UsuariosWidget({Key? key}) : super(key: key);
  final GrupoController gruposController = Get.find();

  final TextEditingController codGrupoController = TextEditingController();
  final TextEditingController usuarioController = TextEditingController();
  final TextEditingController nomeUsuarioController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final TextEditingController confirmacaoSenhaController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: GetPlatform.isMobile
          ? mobileScreen(gruposController)
          : desktopScreen(gruposController),
    );
  }

  void salvarUsuario() {
    final String usuario = usuarioController.text;
    final String senha = senhaController.text;
    final String confirmacaoSenha = confirmacaoSenhaController.text;

    debugPrint("$usuario - $senha - $confirmacaoSenha");
  }

  Widget mobileScreen(GrupoController gruposController) {
    return Column(
      children: [
        Column(
          children: [
            CustomTextField(
              controller: usuarioController,
              inputType: TextInputType.text,
              label: "Informe o Usuário",
            ),
            CustomTextField(
              controller: nomeUsuarioController,
              inputType: TextInputType.name,
              label: "Informe o Nome",
            ),
            CustomDropdown(
              valorAtual: gruposController.grupoSelecionado,
              hintText: 'Selecione um Grupo',
              desktop: false,
              onchanged: (valor) {
                gruposController.setSelecionado(valor);
              },
              items: gruposController.grupos,
            ),
            CustomTextField(
              controller: emailController,
              inputType: TextInputType.emailAddress,
              label: "Informe o Email",
            ),
            PasswordField(
              controller: senhaController,
              inputType: TextInputType.text,
              label: "Senha",
              hint: "Informe sua Senha",
            ),
            PasswordField(
              controller: confirmacaoSenhaController,
              inputType: TextInputType.text,
              label: "Confirmar Senha",
              hint: "Confirme a senha digitada",
            ),
            ButtonSave(
              onClick: salvarUsuario,
            ),
          ],
        ),
      ],
    );
  }

  Widget desktopScreen(GrupoController gruposController) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Flexible(
          flex: 2,
          child: SizedBox(
            width: Get.width * 0.3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTextField(
                  controller: usuarioController,
                  inputType: TextInputType.text,
                  label: "Informe o Usuário",
                ),
                CustomTextField(
                  controller: emailController,
                  inputType: TextInputType.emailAddress,
                  label: "Informe o Email",
                ),
                PasswordField(
                  controller: senhaController,
                  inputType: TextInputType.text,
                  label: "Senha",
                  hint: "Informe sua Senha",
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ButtonSave(
                      onClick: salvarUsuario,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: SizedBox(
            width: Get.width * 0.3,
            child: Column(
              children: [
                CustomTextField(
                  controller: nomeUsuarioController,
                  inputType: TextInputType.name,
                  label: "Informe o Nome",
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 28.0, 16.0, 8.0),
                  child: DropdownButton<Grupo>(
                    hint: const Text('Selecione um Grupo'),
                    icon: const Icon(Icons.arrow_drop_down),
                    isExpanded: true,
                    items: gruposController.grupos
                        .map((item) => DropdownMenuItem<Grupo>(
                              value: item,
                              child: Text(
                                item.toString(),
                              ),
                            ))
                        .toList(),
                    value: gruposController.grupoSelecionado,
                    onChanged: (Grupo? value) =>
                        gruposController.setSelecionado(value),
                  ),
                ),
                PasswordField(
                  controller: confirmacaoSenhaController,
                  inputType: TextInputType.text,
                  label: "Confirmar Senha",
                  hint: "Confirme a senha digitada",
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
