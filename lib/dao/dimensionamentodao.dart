import 'package:sunlight/model/infocidade.dart';

import '../model/dimensionamentorealizado.dart';

abstract class DimensionamentoDao {
  Future<List<DimensionamentoRealizado>> listar();
  Future<DimensionamentoRealizado> salvar(DimensionamentoRealizado dimensionamentorealizado);
  Future excluir(DimensionamentoRealizado dimensionamentorealizado);
  Future atualizar(DimensionamentoRealizado dimensionamentorealizado);
}