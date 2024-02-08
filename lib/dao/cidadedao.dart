import '../model/Cidade.dart';
import '../model/infocidade.dart';

abstract class CidadeDao {
  Future<List<Cidade>> listar();
}