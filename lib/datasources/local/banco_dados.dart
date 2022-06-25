import 'package:aula02_pos_25_06_2022/datasources/local/editora_helper.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class BancoDados {
  BancoDados.internal();
  static final BancoDados _instance = BancoDados.internal();
  factory BancoDados() => _instance;

  Database? _db;

  Future<Database> get db async {
    /*
    if (_db == null) {
      _db = await _iniciarDb();
    }
    */
    _db ??= await _iniciarDb();
    return _db!;
  }

  Future<Database> _iniciarDb() async {
    final pathDb = await getDatabasesPath();
    final caminhoBanco = join(pathDb, 'meus_livros.db');

    return await openDatabase(caminhoBanco, version: 1,
      onCreate: (Database db, int newVersion) async {
        await db.execute(EditoraHelper.SQL_CREATE);
      }
    );
  }
}