class Editora {
  static const TABELA = 'TbEditora';
  static const CODIGO = 'codigo';
  static const NOME = 'nome';

  int? codigo;
  String nome;

  Editora({this.codigo, required this.nome});

  factory Editora.fromMap(Map map) {
    return Editora(
      codigo: int.tryParse(map[CODIGO].toString()),
      nome: map[NOME]
    );
  }

  Map<String, dynamic> toMap() => { CODIGO: codigo, NOME: nome };
}