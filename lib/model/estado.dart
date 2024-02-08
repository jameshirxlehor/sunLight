class Estado{
  late int id;
  late String nome;

  Estado({required this.id, required this.nome});


  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome
    };
  }

  static Estado fromMap(Map<String, dynamic> map) {
    return Estado(
      id: map['id'],
      nome: map['nome'],
    );
  }

  @override
  String toString() {
    return "Estado(id=$id, nome=$nome)";
  }
}

