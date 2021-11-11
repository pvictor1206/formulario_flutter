import 'package:flutter/material.dart';


class TextFieldWidget extends StatelessWidget {

  TextEditingController Controle = TextEditingController();
  String text;


  TextFieldWidget({required this.Controle, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: Controle,
      decoration: InputDecoration(
        hintText: text,
        border: OutlineInputBorder(),
        prefixIcon: Icon(Icons.person,color: Colors.blueAccent,),
        filled: true,
        fillColor: Colors.blue.shade100,
      ),
    );
  }
}
