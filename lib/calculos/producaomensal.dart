import 'package:sunlight/model/calculogeracao.dart';
import 'package:sunlight/model/infocidade.dart';
import 'package:sunlight/model/producaototal.dart';

import '../model/infoDimensionamento.dart';

producaoMensal(InfoCidade infocidade, int potenciaModulo, double rendimentoSistema, double mediaConsumoCliente ){
  late double indiceSolarCidadeNoMes;

  double IndiceSolAnual = infocidade.anual;


  double indiceSolarCidadeNoMesJan = infocidade.jan;
  double indiceSolarCidadeNoMesFev = infocidade.fev;
  double indiceSolarCidadeNoMesMar = infocidade.mar;
  double indiceSolarCidadeNoMesAbr = infocidade.abr;
  double indiceSolarCidadeNoMesMai = infocidade.mai;
  double indiceSolarCidadeNoMesJun = infocidade.jun;
  double indiceSolarCidadeNoMesJul = infocidade.jul;
  double indiceSolarCidadeNoMesAgo = infocidade.ago;
  double indiceSolarCidadeNoMesSete = infocidade.sete;
  double indiceSolarCidadeNoMesOutu = infocidade.outu;
  double indiceSolarCidadeNoMesNov = infocidade.nov;
  double indiceSolarCidadeNoMesDez = infocidade.dez;


  double producaoMensal;
  double mediaGeradaPorModulo;
  double sugestaoModulos;
  double potenciaDoKit;
  double areaOcupada;


  double indiceMensalJan = (indiceSolarCidadeNoMesJan * 365/12 * potenciaModulo * rendimentoSistema )/1000;
  double indiceMensalFev = (indiceSolarCidadeNoMesFev * 365/12 * potenciaModulo * rendimentoSistema )/1000;
  double indiceMensalMar = (indiceSolarCidadeNoMesMar * 365/12 * potenciaModulo * rendimentoSistema )/1000;
  double indiceMensalAbr = (indiceSolarCidadeNoMesAbr * 365/12 * potenciaModulo * rendimentoSistema )/1000;
  double indiceMensalMai = (indiceSolarCidadeNoMesMai * 365/12 * potenciaModulo * rendimentoSistema )/1000;
  double indiceMensalJun = (indiceSolarCidadeNoMesJun * 365/12 * potenciaModulo * rendimentoSistema )/1000;
  double indiceMensalJul = (indiceSolarCidadeNoMesJul * 365/12 * potenciaModulo * rendimentoSistema )/1000;
  double indiceMensalAgo = (indiceSolarCidadeNoMesAgo * 365/12 * potenciaModulo * rendimentoSistema )/1000;
  double indiceMensalSete = (indiceSolarCidadeNoMesSete * 365/12 * potenciaModulo * rendimentoSistema )/1000;
  double indiceMensalOutu = (indiceSolarCidadeNoMesOutu * 365/12 * potenciaModulo * rendimentoSistema )/1000;
  double indiceMensalNov = (indiceSolarCidadeNoMesNov * 365/12 * potenciaModulo * rendimentoSistema )/1000;
  double indiceMensalDez = (indiceSolarCidadeNoMesDez * 365/12 * potenciaModulo * rendimentoSistema )/1000;

  mediaGeradaPorModulo = ((IndiceSolAnual*(365/12) * potenciaModulo * rendimentoSistema)/1000);

  sugestaoModulos = mediaConsumoCliente/mediaGeradaPorModulo;

  double producaoMensalJan = (indiceMensalJan * sugestaoModulos);
  double producaoMensalFev = (indiceMensalFev * sugestaoModulos);
  double producaoMensalMar = (indiceMensalMar * sugestaoModulos);
  double producaoMensalAbr = (indiceMensalAbr * sugestaoModulos);
  double producaoMensalMai = (indiceMensalMai * sugestaoModulos);
  double producaoMensalJun = (indiceMensalJun * sugestaoModulos);
  double producaoMensalJul = (indiceMensalJul * sugestaoModulos);
  double producaoMensalAgo = (indiceMensalAgo * sugestaoModulos);
  double producaoMensalSete = (indiceMensalSete * sugestaoModulos);
  double producaoMensalOutu = (indiceMensalOutu * sugestaoModulos);
  double producaoMensalNov = (indiceMensalNov * sugestaoModulos);
  double producaoMensalDez = (indiceMensalDez * sugestaoModulos);

 Producaototal producao = Producaototal(
   producaoMensalJan: producaoMensalJan,
   producaoMensalFev: producaoMensalFev,
   producaoMensalMar: producaoMensalMar,
   producaoMensalAbr: producaoMensalAbr,
   producaoMensalMai: producaoMensalMai,
   producaoMensalJun: producaoMensalJun,
   producaoMensalJul: producaoMensalJul,
   producaoMensalAgo: producaoMensalAgo,
   producaoMensalSete: producaoMensalSete,
   producaoMensalOutu: producaoMensalOutu,
   producaoMensalNov: producaoMensalNov,
   producaoMensalDez: producaoMensalDez
 );
  potenciaDoKit = (sugestaoModulos.ceil() * potenciaModulo)/1000;

  areaOcupada = potenciaDoKit * 6.5;

  return CalculoGeracao(producaoTotal: producao, potenciaDoKit: potenciaDoKit, areaOcupada: areaOcupada, sugestaoModulos: sugestaoModulos);

}