import 'package:flutter/material.dart';
import 'package:formulario_flutter/models/form/form_model.dart';
import 'package:formulario_flutter/modules/form/widget/text_field/text_field_widget.dart';

class FormPage extends StatelessWidget {


  final  TextEditingController _nomeControle = TextEditingController();
  final  TextEditingController _cpfControle = TextEditingController();
  final  TextEditingController _rgControle = TextEditingController();

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


                    Text("Cadastro de Cliente",style: TextStyle(fontSize: 30.0, color: Colors.white),),

                    SizedBox(height: 30),

                    TextFieldWidget(Controle: _nomeControle, text: "Nome"),

                    SizedBox(height: 10),

                    TextFieldWidget(Controle: _cpfControle, text: "CPF"),

                    SizedBox(height: 10),

                    TextFieldWidget(Controle: _rgControle, text: "RG"),


                    SizedBox(height: 20),


                    RaisedButton(
                      onPressed: (){

                        final String nome = _nomeControle.text;
                        final int? cpf = int.tryParse(_cpfControle.text);
                        final int? rg = int.tryParse(_rgControle.text);


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
