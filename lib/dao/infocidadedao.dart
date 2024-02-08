import '../model/estado.dart';
import '../model/infocidade.dart';

abstract class infoCidadeDao {
  Future<List<InfoCidade>> listar();

}