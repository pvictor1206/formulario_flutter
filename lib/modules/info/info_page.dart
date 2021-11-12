import 'package:flutter/material.dart';
import 'package:formulario_flutter/database/db.dart';
import 'package:formulario_flutter/models/form/form_model.dart';
import 'package:formulario_flutter/modules/form/form_page.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class InfoPage extends StatefulWidget {
  DatabaseClientes handler;


  InfoPage({required this.handler});

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.blueGrey,

      appBar: AppBar(
        title: Text(""),
      ),

      body: FutureBuilder(
        future: this.widget.handler.retrieveClientes(),
        builder: (BuildContext context, AsyncSnapshot<List<Clientes>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Icon(Icons.delete_forever),
                  ),
                  key: ValueKey<int>(snapshot.data![index].cpf!),
                  onDismissed: (DismissDirection direction) async {
                    await this.widget.handler.deleteClientes(snapshot.data![index].cpf!);
                    setState(() {
                      snapshot.data!.remove(snapshot.data![index]);
                    });
                  },
                  child: Center(
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


                                Text("Informações do Cliente", style: TextStyle(fontSize: 30.0, color: Colors.white),),


                                SizedBox(height: 30),


                                Text("NOME: ${snapshot.data![index].nome}", style: TextStyle(fontSize: 20.0, color: Colors.white),),
                                Text("CPF: ${snapshot.data![index].cpf}", style: TextStyle(fontSize: 20.0, color: Colors.white),),
                                Text("RG: ${snapshot.data![index].rg}", style: TextStyle(fontSize: 20.0, color: Colors.white),),






                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),


    );
  }
}
