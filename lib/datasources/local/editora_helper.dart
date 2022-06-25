import 'package:aula02_pos_25_06_2022/datasources/local/banco_dados.dart';
import 'package:aula02_pos_25_06_2022/models/models.dart';
import 'package:sqflite/sqflite.dart';

class EditoraHelper {
  static const SQL_CREATE = '''
    CREATE TABLE ${Editora.TABELA} (
      ${Editora.CODIGO} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${Editora.NOME} TEXT
    )
  ''';

  void inserir(Editora editora) async {
    Database db = await BancoDados().db;
    db.insert(Editora.TABELA, editora.toMap());
  }

  void alterar(Editora editora) async {
    Database db = await BancoDados().db;

    db.update(
      Editora.TABELA,
      editora.toMap(),
      where: '${Editora.CODIGO} = ?',
      whereArgs: [editora.codigo]
    );
  }

  void excluir(Editora editora) async {
    Database db = await BancoDados().db;

    db.delete(
      Editora.TABELA,
      where: '${Editora.CODIGO} = ?',
      whereArgs: [editora.codigo]
    );
  }

  Future<List<Editora>> getTodos() async {
    Database db = await BancoDados().db;

    List listaBanco = await db.query(Editora.TABELA);

    return listaBanco.map((item) => Editora.fromMap(item)).toList();
    /*
    List<Editora> listaEditora = [];
    for (int i = 0; i < listaBanco.length; i++) {
      Editora editora = Editora.fromMap(listaBanco[i]);
      listaEditora.add(editora);
    }
    return listaEditora;
    */
  }
}