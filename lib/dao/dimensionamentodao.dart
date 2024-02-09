import '../model/dimensionamentorealizado.dart';



abstract class DimensionamentoDao {
  Future<List<DimensionamentoRealizado>> listar();
}