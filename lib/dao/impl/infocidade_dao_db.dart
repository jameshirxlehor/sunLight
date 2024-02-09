import 'package:sqflite/sqflite.dart';
import 'package:sunlight/model/infocidade.dart';
import '../../model/Cidade.dart';
import '../cidadedao.dart';
import '../infocidadedao.dart';

class infoCidadeDaoDb implements infoCidadeDao {
  Database db;
  final String tabelaCidade = "indicesolar";
  infoCidadeDaoDb({required this.db});

  @override
  Future<List<InfoCidade>> listar() async {
    final List<Map<String, dynamic>> result = await db.query(tabelaCidade);
    return result.map((element) => InfoCidade.fromMap(element)).toList();
  }

}