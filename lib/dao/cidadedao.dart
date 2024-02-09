import '../model/Cidade.dart';


abstract class CidadeDao {
  Future<List<Cidade>> listar();
}