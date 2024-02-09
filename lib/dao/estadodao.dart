import '../model/estado.dart';

abstract class EstadoDao {
  Future<List<Estado>> listar();
}