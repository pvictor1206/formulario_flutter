import 'package:formulario_flutter/models/form/form_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseClientes {
  Future<Database> initializeDB() async {
    String path = await getDatabasesPath();
    return openDatabase(
      join(path, 'databaseClientes.db'),
      onCreate: (database, version) async {
        await database.execute(
          "CREATE TABLE clientes(nome TEXT, cpf INTEGER PRIMARY KEY, rg INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<int> insertClientes(List<Clientes> clientes) async {
    int result = 0;
    final Database db = await initializeDB();
    for(var user in clientes){
      result = await db.insert('clientes', user.toMap());
    }
    return result;
  }


  Future<List<Clientes>> retrieveClientes() async {
    final Database db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query('clientes');
    return queryResult.map((e) => Clientes.fromMap(e)).toList();
  }

  Future<void> deleteClientes(int cpf) async {
    final db = await initializeDB();
    await db.delete(
      'clientes',
      where: "cpf = ?",
      whereArgs: [cpf],
    );
  }


}



