import 'package:aula02_pos_25_06_2022/datasources/datasources.dart';
import 'package:aula02_pos_25_06_2022/models/models.dart';
import 'package:aula02_pos_25_06_2022/ui/ui.dart';
import 'package:flutter/material.dart';

class CadEditoraPage extends StatefulWidget {
  final Editora? editora;

  const CadEditoraPage({this.editora, Key? key}) : super(key: key);

  @override
  State<CadEditoraPage> createState() => _CadEditoraPageState();
}

class _CadEditoraPageState extends State<CadEditoraPage> {
  final _editoraHelper = EditoraHelper();
  final _nomeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.editora != null) {
      _nomeController.text = widget.editora!.nome;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Editora'),
        centerTitle: true,
        actions: [
          widget.editora != null
              ? IconButton(onPressed: _excluir, icon: const Icon(Icons.delete_forever, color: Colors.orange,))
              : SizedBox(),

          IconButton(onPressed: _salvar, icon: const Icon(Icons.save)),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          _criarBotaoExcluir(),

          FloatingActionButton(
            backgroundColor: Colors.green.shade700,
            onPressed: _salvar,
            child: const Icon(Icons.save),
          ),
        ],
      ),
      body: ListView(
        children: [
          CampoTexto(controller: _nomeController, texto: 'Nome da Editora'),
        ],
      ),
    );
  }

  Widget _criarBotaoExcluir() {
    return widget.editora == null
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.only(right: 16),
            child: FloatingActionButton(
              backgroundColor: Colors.red.shade700,
              onPressed: _excluir,
              child: const Icon(Icons.delete_forever),
            ),
      );
  }

  void _salvar() {
    if (_nomeController.text.isEmpty) {
      return;
    }

    if (widget.editora == null) {
      _editoraHelper.inserir(Editora(nome: _nomeController.text));
    }
    else {
      _editoraHelper.alterar(Editora(
        nome: _nomeController.text,
        codigo: widget.editora!.codigo
      ));
    }

    Navigator.pop(context);
  }

  void _excluir() {
    if (widget.editora != null) {
      _editoraHelper.excluir(widget.editora!);
    }

    Navigator.pop(context);
  }
}