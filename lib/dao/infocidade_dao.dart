
import 'package:sunlight/model/infocidade.dart';

abstract class InfoCidadeDao {
  Future<Map<String,List<InfoCidade>>> listarCidades();
}
