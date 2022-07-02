import 'package:aula02_pos_25_06_2022/enums/botao_enum.dart';
import 'package:aula02_pos_25_06_2022/ui/ui.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usuarioController = TextEditingController();
  final _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _criarTopo(),
          CampoTexto(controller: _usuarioController, texto: 'Usuário'),
          CampoTexto(controller: _senhaController, texto: 'Senha', isSenha: true),
          Botao(texto: 'Entrar', clique: _entrarClique),
        ],
      ),
    );
  }

  Widget _criarTopo() {
    return Container(
      height: 250,
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).primaryColorLight,
            Theme.of(context).primaryColorDark,
          ]
        ),
        boxShadow: const [
          BoxShadow(
            offset: Offset(2, 2),
            spreadRadius:0,
            blurRadius: 5,
            color: Colors.black,
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(80),
          topRight: Radius.circular(80),
          bottomRight: Radius.circular(20),
          topLeft: Radius.circular(20)
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.punch_clock_outlined, size: 80, color: Colors.white,),
          Text('Meus Livros', style: TextStyle(color: Colors.white, fontSize: 32),),
          Text('Login', style: TextStyle(color: Colors.white, fontSize: 28),),
        ],
      ),
    );
  }

  void _entrarClique() {
    if ((_usuarioController.text == 'admin') && (_senhaController.text == 'admin')) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
    }
    else {
      MensagemAlerta().show(
          context: context,
          titulo: 'Login',
          texto: 'Usuário ou senha inválidos!',
          botoes: [
            Botao(texto: 'Ok', tipo: BotaoEnum.texto, clique: () { Navigator.pop(context); }),
          ]
      );
    }
  }
}
