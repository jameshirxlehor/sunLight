class DimensionamentoRealizado {
  int? id;
  String nome;
  String data;
  String estado;
  String cidade;
  String orientacaoPlacas;
  int potenciaPlaca;
  bool mesOuMedia;
  double? mediaConsumo;
  double? jan;
  double? fev;
  double? mar;
  double? abr;
  double? mai;
  double? jun;
  double? jul;
  double? ago;
  double? sete;
  double? outu;
  double? nov;
  double? dez;

  DimensionamentoRealizado({
    this.id,
    required this.nome,
    required this.data,
    required this.estado,
    required this.cidade,
    required this.orientacaoPlacas,
    required this.potenciaPlaca,
    required this.mesOuMedia,
    this.mediaConsumo,
    this.jan,
    this.fev,
    this.mar,
    this.abr,
    this.mai,
    this.jun,
    this.jul,
    this.ago,
    this.sete,
    this.outu,
    this.nov,
    this.dez
  });



  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'estado': estado,
      'cidade':cidade,
      'orientacaoPlacas':orientacaoPlacas,
      'potenciaPlaca': potenciaPlaca,
      'mesOuMedia':mesOuMedia ? 1:0,
      'data': data,
      'jan': jan,
      'fev': fev,
      'mar': mar,
      'abr': abr,
      'mai': mai,
      'jun': jun,
      'jul': jul,
      'ago': ago,
      'sete': sete,
      'outu': outu,
      'nov': nov,
      'dez': dez,
      'mediaConsumo': mediaConsumo
    };
  }

  static DimensionamentoRealizado fromMap(Map<String, dynamic> map) {
    return DimensionamentoRealizado(
        id: map['id'],
        nome: map['nome'],
        estado: map['estado'],
        orientacaoPlacas: map['orientacaoPlacas'],
        potenciaPlaca: map['potenciaPlaca'],
        mesOuMedia: map['mesOuMedia'] == 1 ? true : false,
        jan: map['jan'],
        fev: map['jan'],
        mar: map['jan'],
        abr: map['jan'],
        mai: map['jan'],
        jun: map['jan'],
        jul: map['jan'],
        ago: map['jan'],
        sete: map['jan'],
        outu: map['jan'],
        nov: map['jan'],
        dez: map['jan'],
        data: map['data'],
        cidade: map['cidade'],
        mediaConsumo: map['mediaConsumo']
    );
  }




}
