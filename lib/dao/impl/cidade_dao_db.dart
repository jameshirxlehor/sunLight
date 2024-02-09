import 'package:sqflite/sqflite.dart';
import '../../model/Cidade.dart';
import '../cidadedao.dart';

class CidadeDaoDb implements CidadeDao {
  Database db;
  final String tabelaCidade = "Cidade";
  CidadeDaoDb({required this.db});

  @override
  Future<List<Cidade>> listar() async {
    final List<Map<String, dynamic>> result = await db.query("indicesolar",
        columns: [tabelaCidade]);
    return result.map((element) => Cidade.fromMap(element)).toList();
  }

}