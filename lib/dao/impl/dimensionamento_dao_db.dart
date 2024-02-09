import 'package:sqflite/sqflite.dart';
import '../../model/dimensionamentorealizado.dart';
import '../dimensionamentodao.dart';

class DimensionamentoDaoDb implements DimensionamentoDao {
  Database db;
  final String tabelaDimensionamentos = "dimensionamentos";
  DimensionamentoDaoDb({required this.db});

  @override
  Future<List<DimensionamentoRealizado>> listar() async {
    final List<Map<String, dynamic>> result = await db.query(tabelaDimensionamentos);
    return result.map((element) => DimensionamentoRealizado.fromMap(element)).toList();
  }

}