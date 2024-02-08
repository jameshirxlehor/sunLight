import 'package:sqflite/sqflite.dart';
import '../../model/Cidade.dart';
import '../cidadedao.dart';

class CidadeDaoDb implements CidadeDao {
  Database? _db;
  final String tabelaCidade = "Cidade";

  @override
  Future<List<Cidade>> listar() async {
    final List<Map<String, dynamic>> result = await _db!.query("indicesolar",
        columns: [tabelaCidade]);
    return result.map((element) => Cidade.fromMap(element)).toList();
  }

}