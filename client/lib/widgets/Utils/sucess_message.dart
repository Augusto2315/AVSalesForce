import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SucessMessage {
  const SucessMessage({required this.mensagem});
  final String mensagem;

  void show() {
    Get.snackbar(
      'Sucesso!',
      mensagem,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      icon: const Icon(
        Icons.done,
        color: Colors.white,
      ),
      duration: const Duration(seconds: 2),
    );
  }
}
