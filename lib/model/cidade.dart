class Cidade{
  late int id;
  late String nome;

  Cidade({required this.id, required this.nome});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome
    };
  }

  static Cidade fromMap(Map<String, dynamic> map) {
    return Cidade(
      id: map['id'],
      nome: map['nome'],
    );
  }

  @override
  String toString() {
    return "Cidade(id=$id, nome=$nome)";
  }
}

