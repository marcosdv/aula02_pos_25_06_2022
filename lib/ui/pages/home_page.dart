import 'package:aula02_pos_25_06_2022/datasources/datasources.dart';
import 'package:aula02_pos_25_06_2022/models/models.dart';
import 'package:aula02_pos_25_06_2022/ui/ui.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _editoraHelper = EditoraHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Livros'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _abrirCadastroEditora,
        child: const Icon(Icons.add),
      ),
      body: FutureBuilder(
        future: _editoraHelper.getTodos(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
            case ConnectionState.none:
              return const CircularProgressIndicator();
            default:
              if (snapshot.hasError) {
                return Text('Erro ao buscar as Editoras! ${snapshot.error}');
              }
              return _criarListagem(snapshot.data as List<Editora>);
          }
        },
      ),
    );
  }

  Widget _criarListagem(List<Editora> lista) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      scrollDirection: Axis.vertical,
      itemCount: lista.length,
      itemBuilder: (context, index) {
        return Card(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Text(lista[index].nome, style: const TextStyle(fontSize: 22),),
          ),
        );
      }
    );
  }

  void _abrirCadastroEditora() {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => CadEditoraPage()));
  }
}