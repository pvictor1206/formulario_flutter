class Clientes{

  final String nome;
  final int? cpf;
  final int? rg;

  Clientes({required this.nome, this.cpf, this.rg});


  Clientes.fromMap(Map<String, dynamic> res) :
      nome = res["nome"],
      cpf = res["cpf"],
      rg = res["rg"];

  Map<String, Object?> toMap() {
    return {'nome':nome,"cpf":cpf,"rg":rg};
  }

}
