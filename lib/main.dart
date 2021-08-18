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


  final  TextEditingController _nomeControle = TextEditingController();
  final  TextEditingController _quantidadeControle = TextEditingController();
  final  TextEditingController _valorControle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text("Cadastrar Produto"),
      ),

      body: Container(
        color: Colors.lightBlue,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // Criar classes amanhã...


              Text("Cadastro de Produto",style: TextStyle(fontSize: 30.0, color: Colors.white),),

              SizedBox(height: 30),

              TextField(
                controller: _nomeControle,
                decoration: InputDecoration(
                  hintText: 'Nome',
                  border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.add_shopping_cart,color: Colors.blueAccent,),
                  filled: true,
                  fillColor: Colors.blue.shade100,
                ),
              ),

              SizedBox(height: 10),

              TextField(
                controller: _quantidadeControle,
                decoration: InputDecoration(
                  hintText: 'Quantidade',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.add_circle_outlined, color: Colors.blueAccent,),
                  filled: true,
                  fillColor: Colors.blue.shade100,
                ),
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 10),

              TextField(
                controller: _valorControle,
                decoration: InputDecoration(
                  hintText: 'Valor',
                  prefixIcon: Icon(Icons.attach_money,color: Colors.blueAccent,),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.blue.shade100,
                ),
                keyboardType: TextInputType.number,
              ),

              SizedBox(height: 20),


              RaisedButton(
                  onPressed: (){

                    final String nome = _nomeControle.text;
                    final int? quantidade = int.tryParse(_quantidadeControle.text);
                    final double? valor = double.tryParse(_valorControle.text);


                  },

                child: Text("Cadastrar"),

              ),



            ],
          ),
        ),
      ),


    );
  }
}

class Produto{

  final String nome;
  final int quantidade;
  final double valor;

  Produto(this.nome, this.quantidade, this.valor);

}



