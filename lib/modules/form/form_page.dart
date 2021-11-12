import 'package:flutter/material.dart';
import 'package:formulario_flutter/database/db.dart';
import 'package:formulario_flutter/models/form/form_model.dart';
import 'package:formulario_flutter/modules/form/widget/text_field/text_field_widget.dart';
import 'package:formulario_flutter/modules/info/info_page.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:formulario_flutter/models/form/form_model.dart';



class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final TextEditingController _nomeControle = TextEditingController();
  final TextEditingController _cpfControle = TextEditingController();
  final TextEditingController _rgControle = TextEditingController();

  late DatabaseClientes handler;

  @override
  void initState() {
    super.initState();
    this.handler = DatabaseClientes();
    this.handler.initializeDB().whenComplete(() async {
      await this.addUsers();
      setState(() {});
    });
  }

  Future<int> addUsers() async {
    Clientes firstUser = Clientes(nome: _nomeControle.text, cpf: int.tryParse(_cpfControle.text), rg: int.tryParse(_rgControle.text));
    List<Clientes> listOfUsers = [firstUser];
    return await this.handler.insertClientes(listOfUsers);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blueGrey,

      appBar: AppBar(
        title: Text("Cadastrar Cliente"),
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(const Radius.circular(25.0)),
                color: Colors.lightBlue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [


                    Text("Cadastro de Cliente",
                      style: TextStyle(fontSize: 30.0, color: Colors.white),),

                    SizedBox(height: 30),

                    TextFieldWidget(Controle: _nomeControle, text: "Nome"),

                    SizedBox(height: 10),

                    TextFieldWidget(Controle: _cpfControle, text: "CPF"),

                    SizedBox(height: 10),

                    TextFieldWidget(Controle: _rgControle, text: "RG"),


                    SizedBox(height: 20),


                    RaisedButton(
                      onPressed: () {

                        addUsers();

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InfoPage(handler: handler)
                            )
                        );

                      },

                      child: Text("Cadastrar"),

                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),


    );
  }

}
