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
    await db.insert(Editora.TABELA, editora.toMap());
  }
}