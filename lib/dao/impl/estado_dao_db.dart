import 'package:sqflite/sqflite.dart';
import 'package:sunlight/model/infocidade.dart';

import '../../model/estado.dart';
import '../estadodao.dart';

class EstadoDaoDb implements EstadoDao {
  Database? _db;
  final String tabelaEstado = "Estado";

  @override
  Future<List<Estado>> listar() async {
    final List<Map<String, dynamic>> result = await _db!.query("indicesolar",
        columns: [tabelaEstado]);
    return result.map((element) => Estado.fromMap(element)).toList();
  }

}