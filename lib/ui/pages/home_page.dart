import 'package:aula02_pos_25_06_2022/datasources/datasources.dart';
import 'package:aula02_pos_25_06_2022/models/models.dart';
import 'package:aula02_pos_25_06_2022/ui/ui.dart';
import 'package:flutter/material.dart';

import '../../enums/botao_enum.dart';

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
      appBar: AppBar(title: const Text('Meus Livros')),
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
        return Dismissible(
          key: UniqueKey(),
          direction: DismissDirection.horizontal,
          onDismissed: (DismissDirection direction) {
            if (direction == DismissDirection.startToEnd) {
              _abrirCadastroEditora(editora: lista[index]);
            }
            else if (direction == DismissDirection.endToStart) {
              _editoraHelper.excluir(lista[index]);
            }
          },
          confirmDismiss: (DismissDirection direction) async {
            if (direction == DismissDirection.endToStart) {
              return await MensagemAlerta().show(context: context,
                  titulo: 'Atenção',
                  texto: 'Deseja realmente excluir essa editora?',
                  botoes: [
                    Botao(texto: 'Sim', tipo: BotaoEnum.texto, clique: () {
                      Navigator.of(context).pop(true);
                    }),
                    Botao(texto: 'Não', clique: () {
                      Navigator.of(context).pop(false);
                    }),
                  ]
              );
            }
            return true;
          },
          background: const BackgroundDismissible(
            corFundo: Colors.blue,
            corTexto: Colors.white,
            texto: 'Editar Editora',
            icone: Icons.edit_note
          ),
          secondaryBackground: const BackgroundDismissible(
            corFundo: Colors.red,
            corTexto: Colors.white,
            texto: 'Excluir Editora',
            icone: Icons.delete_forever_outlined,
            alinharDireita: true,
          ),
          child: _criarItemLista(lista[index]),
        );
      }
    );
  }

  Widget _criarItemLista(Editora editora) {
    return GestureDetector(
      onTap: () {
        _abrirListaLivros(editora);
      },
      onLongPress: () {
        _abrirCadastroEditora(editora: editora);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              Text(editora.nome, style: const TextStyle(fontSize: 22),),
            ],
          ),
        ),
      ),
    );
  }

  void _abrirListaLivros(Editora editora) {
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => LivrosPage(editora: editora)));
  }

  void _abrirCadastroEditora({Editora? editora}) async {
    await Navigator.push(context, MaterialPageRoute(
        builder: (context) => CadEditoraPage(editora: editora,)));

    setState(() { });
  }
}