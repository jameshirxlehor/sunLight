import '../model/estado.dart';
import '../model/infocidade.dart';

abstract class EstadoDao {
  Future<List<Estado>> listar();
}