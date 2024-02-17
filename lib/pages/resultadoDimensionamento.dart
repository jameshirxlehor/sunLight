import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunlight/domain/mediator.dart';
import 'package:sunlight/model/calculogeracao.dart';
import 'package:sunlight/model/producaototal.dart';

import '../dao/dimensionamentodao.dart';
import '../dao/impl/dimensionamento_dao_db.dart';
import '../model/dimensionamentorealizado.dart';

class ResultadoDimensionamento extends StatefulWidget {
  CalculoGeracao calculos;
  DimensionamentoRealizado dimensionamentoRealizadoEnviadoDeOutraTela;

  ResultadoDimensionamento(
      {super.key,
      required this.calculos,
      required this.dimensionamentoRealizadoEnviadoDeOutraTela});

  @override
  State<ResultadoDimensionamento> createState() =>
      _ResultadoDimensionamentoState();
}

class _ResultadoDimensionamentoState extends State<ResultadoDimensionamento> {
  late DimensionamentoDao dimensionamentoDao;
  late DimensionamentoRealizado dimensionamentorealizado =
      widget.dimensionamentoRealizadoEnviadoDeOutraTela;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    dimensionamentoDao = DimensionamentoDaoDb(db: Mediator().db);
  }

  _salvar() {
    dimensionamentoDao.salvar(dimensionamentorealizado);
    Navigator.pop(context);
    Navigator.pop(context);
  }

  _clickSalvar() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Salvar?'),
        content: Text('Tem certeza que deseja salvar?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _salvar();
              },
              child: Text('Salvar')),
        ],
      ),
    );
  }

  List<double> energiaMensal = [
    150.0,
    200.0,
    180.0,
    250.0,
    220.0,
    190.0,
    210.0,
    240.0,
    200.0,
    180.0,
    220.0,
    230.0
  ];

  double calcularMedia(List<double> dados) {
    if (dados.isEmpty) return 0.0;
    return dados.reduce((a, b) => a + b) / dados.length;
  }

  resultado(double? resultado) {
    if (resultado != null) {
      return resultado.toStringAsFixed(2);
    }
  }

  _getRowCadaMes(
    String mes,
    double? consumoMensal,
    double altura,
    double largura,
  ) {
    return Expanded(
      child: Container(
        height: altura * 0.033,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$mes:",
                  style: TextStyle(color: Colors.grey[600], fontSize: 17),
                ),
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${resultado(consumoMensal)} kWh',

                  style: TextStyle(color: Colors.green, fontSize: 17),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _resultadoMedia(Producaototal produtototal) {
    late double producao = produtototal.producaoMensalJan! +
        produtototal.producaoMensalFev! +
        produtototal.producaoMensalMar! +
        produtototal.producaoMensalAbr! +
        produtototal.producaoMensalMai! +
        produtototal.producaoMensalJun! +
        produtototal.producaoMensalJul! +
        produtototal.producaoMensalAgo! +
        produtototal.producaoMensalSete! +
        produtototal.producaoMensalOutu! +
        produtototal.producaoMensalNov! +
        produtototal.producaoMensalDez!;
    return (producao / 12);
  }

  _getRowMedia(Producaototal produtototal) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Média:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              '${_resultadoMedia(produtototal).toStringAsFixed(2)}kWh',
              style: const TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }

  _cardGeracaoMesMedia(
      double altura, double largura, Producaototal produtototal) {
    return Center(
      child: Container(
        width: largura * 0.56,
        height: altura * 0.45,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            _getRowCadaMes(
                "Jan", produtototal.producaoMensalJan, altura, largura),
            _getRowCadaMes(
                "Fev", produtototal.producaoMensalFev, altura, largura),
            _getRowCadaMes(
                "Mar", produtototal.producaoMensalMar, altura, largura),
            _getRowCadaMes(
                "Abr", produtototal.producaoMensalAbr, altura, largura),
            _getRowCadaMes(
                "Mai", produtototal.producaoMensalMai, altura, largura),
            _getRowCadaMes(
                "Jun", produtototal.producaoMensalJun, altura, largura),
            _getRowCadaMes(
                "Jul", produtototal.producaoMensalJul, altura, largura),
            _getRowCadaMes(
                "Ago", produtototal.producaoMensalAgo, altura, largura),
            _getRowCadaMes(
                "Set", produtototal.producaoMensalSete, altura, largura),
            _getRowCadaMes(
                "Out", produtototal.producaoMensalOutu, altura, largura),
            _getRowCadaMes(
                "Nov", produtototal.producaoMensalNov, altura, largura),
            _getRowCadaMes(
                "Dez", produtototal.producaoMensalDez, altura, largura),
            _getRowMedia(produtototal),
          ],
        ),
      ),
    );
  }

  _getCaixaResultados(double sugestaoModulos, double potenciakit, double area,
      double altura, double largura) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: Container(
        width: largura * 0.7,
        height: altura * 0.24,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start
                ,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Icon(Icons.solar_power_outlined, size: 30,)
                  ),
                  Text(
                      "Quantidade de placas: ${sugestaoModulos.ceil().toStringAsFixed(0)} ", style: TextStyle(fontSize: 16),) ,
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Icon(Icons.offline_bolt_outlined, size: 30,)
                  ),
                  Text(
                      "Potência do KIT: ${potenciakit.toStringAsFixed(2)} (kWp)", style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(6.0),
                    child: Icon(Icons.straighten_outlined, size: 30,)
                  ),
                  Text("Area ocupada: ${area.toStringAsFixed(1)} m²", style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    double area = widget.calculos.areaOcupada;

    double potenciakit = widget.calculos.potenciaDoKit;

    Producaototal producaototal = widget.calculos.producaoTotal;

    double sugestaoModulos = widget.calculos.sugestaoModulos;

    _getESpacamentoLadosDinamica() {
      return altura * 0.025;
    }



    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 222, 89),
      appBar: AppBar(
        title: Text(
          'Resultado do Dimensionamento',
         style: GoogleFonts.lobster(fontSize: largura * 0.85 * 0.091,
    color: const  Color.fromARGB(255, 255, 222, 89),
    fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(_getESpacamentoLadosDinamica()), //22.0
          child: Column(
            children: [
              const Text(
                'Geração de Energia Mensal',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: altura * 0.011,
              ),
              _cardGeracaoMesMedia(altura, largura, producaototal),
              _getCaixaResultados(
                  sugestaoModulos, potenciakit, area, altura, largura),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  EasyButton(
                    type: EasyButtonType.elevated,
                    // Conteúdo dentro do botão quando o estado do botão está inativo.
                    idleStateWidget: const Text(
                      'Sair',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    // Conteúdo dentro do botão quando o estado do botão está sendo carregado.
                    loadingStateWidget: const CircularProgressIndicator(
                      strokeWidth: 3.0,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                    // Animar ou não a largura do botão. O padrão é `true`.
                    // Se estiver definido como `false`, você pode querer definir o parâmetro `useEqualLoadingStateWidgetDimension` como `true`.
                    useWidthAnimation: true,
                    // Se deve ou não forçar o `loadingStateWidget` a ter dimensão igual. O padrão é `true`.
                    // Isso é útil quando você está usando `CircularProgressIndicator` como `loadingStateWidget`.
                    // Este parâmetro também pode ser útil quando você define o parâmetro `useWidthAnimation` como `true` combinado com `CircularProgressIndicator` como o valor para `loadingStateWidget`.
                    useEqualLoadingStateWidgetDimension: false,
                    // Se você quiser um tamanho de largura total, defina como double.infinity
                    width: 150.0,
                    height: 40.0,
                    borderRadius: 4.0,
                    // A elevação do botão.
                    // Isso só será aplicado quando o valor do parâmetro de tipo for EasyButtonType.elevated
                    elevation: 0.0,
                    // A lacuna entre o botão e seu conteúdo.
                    // Isso será ignorado quando o valor do parâmetro `type` for definido como `EasyButtonType.text`
                    contentGap: 6.0,
                    //Cor do botão.
                    // Para [EasyButtonType.elevated]: Esta será a cor de fundo.
                    // Para [EasyButtonType.outlined]: Esta será a cor da borda.
                    // Para [EasyButtonType.text]: Esta será a cor do texto.
                    buttonColor: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                  SizedBox(width: 20),
                  EasyButton(
                    type: EasyButtonType.elevated,
                    // Conteúdo dentro do botão quando o estado do botão está inativo.
                    idleStateWidget: const Text(
                      'Salvar',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    // Conteúdo dentro do botão quando o estado do botão está sendo carregado.
                    loadingStateWidget: const CircularProgressIndicator(
                      strokeWidth: 3.0,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                    // Animar ou não a largura do botão. O padrão é `true`.
                    // Se estiver definido como `false`, você pode querer definir o parâmetro `useEqualLoadingStateWidgetDimension` como `true`.
                    useWidthAnimation: true,
                    // Se deve ou não forçar o `loadingStateWidget` a ter dimensão igual. O padrão é `true`.
                    // Isso é útil quando você está usando `CircularProgressIndicator` como `loadingStateWidget`.
                    // Este parâmetro também pode ser útil quando você define o parâmetro `useWidthAnimation` como `true` combinado com `CircularProgressIndicator` como o valor para `loadingStateWidget`.
                    useEqualLoadingStateWidgetDimension: false,
                    // Se você quiser um tamanho de largura total, defina como double.infinity
                    width: 150.0,
                    height: 40.0,
                    borderRadius: 4.0,
                    // A elevação do botão.
                    // Isso só será aplicado quando o valor do parâmetro de tipo for EasyButtonType.elevated
                    elevation: 0.0,
                    // A lacuna entre o botão e seu conteúdo.
                    // Isso será ignorado quando o valor do parâmetro `type` for definido como `EasyButtonType.text`
                    contentGap: 6.0,
                    //Cor do botão.
                    // Para [EasyButtonType.elevated]: Esta será a cor de fundo.
                    // Para [EasyButtonType.outlined]: Esta será a cor da borda.
                    // Para [EasyButtonType.text]: Esta será a cor do texto.
                    buttonColor: Colors.black,
                    onPressed: _clickSalvar,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
