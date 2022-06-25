import 'package:aula02_pos_25_06_2022/models/models.dart';
import 'package:flutter/material.dart';

class LivrosPage extends StatefulWidget {
  final Editora editora;

  const LivrosPage({required this.editora, Key? key}) : super(key: key);

  @override
  State<LivrosPage> createState() => _LivrosPageState();
}

class _LivrosPageState extends State<LivrosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Livros da ${widget.editora.nome}'),
        centerTitle: true,
      ),
    );
  }
}
