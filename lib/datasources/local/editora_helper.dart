import 'package:aula02_pos_25_06_2022/models/models.dart';

class EditoraHelper {
  static const SQL_CREATE = '''
    CREATE TABLE ${Editora.TABELA} (
      ${Editora.CODIGO} INTEGER PRIMARY KEY AUTOINCREMENT,
      ${Editora.NOME} TEXT
    )
  ''';
}