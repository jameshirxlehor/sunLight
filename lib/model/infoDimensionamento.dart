import 'calculogeracao.dart';

class InfoDimensionamento{
  late String nomeDimensionamento;
  double? consumoJan;
  double? consumoFev;
  double? consumoMar;
  double? consumoAbr;
  double? consumoMai;
  double? consumoJun;
  double? consumoJul;
  double? consumoAgo;
  double? consumoSete;
  double? consumoOutu;
  double? consumoNov;
  double? consumoDez;
  late String orientacaoPlacas;
  late String estado;
  late String cidade;
  late double potenciaPlaca;
  late double? mediaConsumo;
  late bool mediaOuMes;

  late CalculoGeracao calculogeracao;

  InfoDimensionamento({
    required this.nomeDimensionamento,
    this.consumoJan,
    this.consumoFev,
    this.consumoMar,
    this.consumoAbr,
    this.consumoMai,
    this.consumoJun,
    this.consumoJul,
    this.consumoAgo,
    this.consumoSete,
    this.consumoOutu,
    this.consumoNov,
    this.consumoDez,
    required this.orientacaoPlacas,
    required this.estado,
    required this.cidade,
    required this.potenciaPlaca,
    this.mediaConsumo,
    required this.calculogeracao,
    required this.mediaOuMes
  });


}