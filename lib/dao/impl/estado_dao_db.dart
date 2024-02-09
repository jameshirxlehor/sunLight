import 'package:sqflite/sqflite.dart';
import 'package:sunlight/model/infocidade.dart';

import '../../model/estado.dart';
import '../estadodao.dart';

class EstadoDaoDb implements EstadoDao {
  Database db;
  final String tabelaEstado = "Estado";
  EstadoDaoDb({required this.db});

  @override
  Future<List<Estado>> listar() async {
    final List<Map<String, dynamic>> result = await db.query("indicesolar",
        columns: [tabelaEstado]);
    return result.map((element) => Estado.fromMap(element)).toList();
  }

}