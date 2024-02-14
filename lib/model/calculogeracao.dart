import 'package:sunlight/model/producaototal.dart';

class CalculoGeracao{
  late Producaototal producaoTotal;
  late double potenciaDoKit;
  late double areaOcupada;
  late double sugestaoModulos;

  CalculoGeracao({
    required this.producaoTotal,
    required this.potenciaDoKit,
    required this.areaOcupada,
    required this.sugestaoModulos
});

  @override
  String toString() {
    return 'CalculoGeracao{producaoMensal: $producaoTotal, potenciaDoKit: $potenciaDoKit, areaOcupada: $areaOcupada,sugestaoModulos: $sugestaoModulos}';
  }
}