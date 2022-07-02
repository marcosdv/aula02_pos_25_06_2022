import 'package:flutter/material.dart';

class BackgroundDismissible extends StatelessWidget {
  final Color corFundo;
  final Color corTexto;
  final String texto;
  final IconData icone;
  final bool alinharDireita;

  const BackgroundDismissible({
    required this.corFundo,
    required this.corTexto,
    required this.texto,
    required this.icone,
    this.alinharDireita = false,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: corFundo,
      child: Row(
        mainAxisAlignment: alinharDireita ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          alinharDireita ? _criarTexto() : _criarIcone(),
          alinharDireita ? _criarIcone() : _criarTexto(),
        ],
      ),
    );
  }

  Widget _criarTexto() {
    return Text(texto, style: TextStyle(color: corTexto, fontSize: 18));
  }

  Widget _criarIcone() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Icon(icone, color: corTexto,),
    );
  }
}
