class InfoCidade {
  late String nome;
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



  static InfoCidade fromPos(List<String> lista) {
    return InfoCidade(
        nome: lista[2],
        logintude: double.parse(lista[3]),
        latitude: double.parse(lista[4]),
        jan: double.parse(lista[5]),
        fev: double.parse(lista[6]),
        mar: double.parse(lista[7]),
        abr: double.parse(lista[8]),
        mai: double.parse(lista[9]),
        jun: double.parse(lista[10]),
        jul: double.parse(lista[11]),
        ago: double.parse(lista[12]),
        sete: double.parse(lista[13]),
        outu: double.parse(lista[14]),
        nov: double.parse(lista[15]),
        dez: double.parse(lista[16]),
        anual: double.parse(lista[17])
    );
  }

  @override
  String toString() {
    return 'InfoCidade{nome: $nome, logintude: $logintude, latitude: $latitude, jan: $jan, fev: $fev, mar: $mar, abr: $abr, mai: $mai, jun: $jun, jul: $jul, ago: $ago, sete: $sete, outu: $outu, nov: $nov, dez: $dez, anual: $anual}';
  }
}
