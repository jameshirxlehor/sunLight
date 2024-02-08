import 'infocidade.dart';

abstract class indiceDao {
  Future iniciar();
  Future<List<InfoCidade>> listar();
}
