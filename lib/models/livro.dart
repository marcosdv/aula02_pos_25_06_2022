import 'package:aula02_pos_25_06_2022/models/models.dart';

class Livro {
  static const TABELA = 'TbLivro';
  static const CODIGO = 'codigo';
  static const NOME = 'nome';
  static const EDITORA = 'codEditora';

  int? codigo;
  String nome;
  Editora editora;

  Livro({this.codigo, required this.nome, required this.editora});

  factory Livro.fromMap(Map mapa, Editora editora) {
    return Livro(
      codigo: int.tryParse(mapa[CODIGO].toString()),
      nome: mapa[NOME],
      editora: editora
    );
  }

  Map<String, dynamic> toMap() => { CODIGO: codigo, NOME: nome, EDITORA: editora.codigo };
}