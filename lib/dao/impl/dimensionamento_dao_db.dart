import 'package:sqflite/sqflite.dart';
import 'package:sunlight/model/infocidade.dart';
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
  @override
  Future<DimensionamentoRealizado> salvar(DimensionamentoRealizado dimensionamentorealizado) async {
    dimensionamentorealizado.id = await db.insert(tabelaDimensionamentos, dimensionamentorealizado.toMap());
    return dimensionamentorealizado;
  }
  @override
  Future excluir(DimensionamentoRealizado dimensionamentorealizado) async {
    await db!.delete(
      tabelaDimensionamentos,
      where: 'id = ?',
      whereArgs: [dimensionamentorealizado.id],
    );
  }

}