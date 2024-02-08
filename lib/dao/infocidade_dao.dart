import 'infocidade.dart';

abstract class infocidadeDao {
  Future iniciar();
  Future<List<InfoCidade>> listar(String tabela);
}
