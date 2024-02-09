import 'package:sqflite/sqflite.dart';
import '../../model/Cidade.dart';
import '../cidadedao.dart';

class CidadeDaoDb implements CidadeDao {
  Database db;
  final String tabelaCidade = "Cidade";
  String estado;
  CidadeDaoDb({required this.db, required this.estado});

  @override
  Future<List<Cidade>> listar() async {
    final List<Map<String, dynamic>> result = await db.query("indicesolar",
        columns: [tabelaCidade],
        where: 'estado = ?',
        whereArgs: [estado]
    );
    return result.map((element) => Cidade.fromMap(element)).toList();
  }

}