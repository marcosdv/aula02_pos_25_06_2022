import 'package:aula02_pos_25_06_2022/datasources/datasources.dart';
import 'package:aula02_pos_25_06_2022/models/models.dart';
import 'package:aula02_pos_25_06_2022/ui/ui.dart';
import 'package:flutter/material.dart';

class CadEditoraPage extends StatefulWidget {
  const CadEditoraPage({Key? key}) : super(key: key);

  @override
  State<CadEditoraPage> createState() => _CadEditoraPageState();
}

class _CadEditoraPageState extends State<CadEditoraPage> {
  final _editoraHelper = EditoraHelper();
  final _nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Editora'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _salvar,
        child: const Icon(Icons.save),
      ),
      body: ListView(
        children: [
          CampoTexto(controller: _nomeController, texto: 'Nome da Editora'),
        ],
      ),
    );
  }

  void _salvar() {
    if (_nomeController.text.isEmpty) {
      return;
    }

    _editoraHelper.inserir(Editora(nome: _nomeController.text));

    Navigator.pop(context);
  }
}