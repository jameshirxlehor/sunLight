class InfoCidade {
  late String nome;
  late String estado;
  late double logintude;
  late double latitude;

  late double jan;
  late double fev;
  late double mar;
  late double abr;
  late double mai;
  late double jun;
  late double jul;
  late double ago;
  late double sete;
  late double outu;
  late double nov;
  late double dez;
  late double anual;

  InfoCidade({
    required this.nome,
    required this.estado,
    required this.logintude,
    required this.latitude,
    required this.jan,
    required this.fev,
    required this.mar,
    required this.abr,
    required this.mai,
    required this.jun,
    required this.jul,
    required this.ago,
    required this.sete,
    required this.outu,
    required this.nov,
    required this.dez,
    required this.anual,
  });

  Map<String, dynamic> toMap() {
    return {
      'Cidade': nome,
      'Estado': estado,
      'logintude': logintude,
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
      'anual': anual,
    };
  }

  static InfoCidade fromMap(Map<String, dynamic> map) {
    return InfoCidade(
        nome: map['Cidade'],
        estado: map['Estado'],
        logintude: map['Longitude'],
        latitude: map['Latitude'],
        jan: map['JAN'],
        fev: map['FEV'],
        mar: map['MAR'],
        abr: map['ABR'],
        mai: map['MAI'],
        jun: map['JUN'],
        jul: map['JUL'],
        ago: map['AGO'],
        sete: map['SETE'],
        outu: map['OUTU'],
        nov: map['NOV'],
        dez: map['DEZ'],
        anual: map['Anual']);
  }
}
