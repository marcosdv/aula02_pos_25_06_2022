import 'package:flutter/material.dart';

class MensagemAlerta {
  void show({
    required BuildContext context,
    required String titulo,
    required String texto,
    required List<Widget> botoes
  }) {
    showDialog(context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(titulo),
          content: Text(texto),
          actions: botoes,
        );
      }
    );
  }
}