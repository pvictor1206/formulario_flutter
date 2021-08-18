import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CadastrarPage()
    );
  }
}

class CadastrarPage extends StatelessWidget {
  const CadastrarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Cadastrar Produto"),
      ),


    );
  }
}



