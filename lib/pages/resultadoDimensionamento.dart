import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/cupertino.dart';
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
  DimensionamentoRealizado dimensionamentoRealizadoEnviadoDeOutraTela;
  late bool novoDimensionamentoOuNao;

  ResultadoDimensionamento(
      {super.key,required this.dimensionamentoRealizadoEnviadoDeOutraTela, required this.novoDimensionamentoOuNao});

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

  _clickExcluir(){

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Excluir?'),
        content: Text('Tem certeza que deseja excluir?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                setState(() {
                  dimensionamentoDao.excluir(dimensionamentorealizado);
                });
              },
              child: Text('Excluir')),
        ],
      ),
    );




  }


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
                  style: GoogleFonts.robotoMono(color: Colors.grey[600], fontSize: 17, fontWeight: FontWeight.w400),
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

                  style: GoogleFonts.robotoMono(color: Colors.green, fontSize: 17,fontWeight: FontWeight.w400  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _resultadoMedia() {
    late double producao = widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoJan +
        widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoFev +
        widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoMar +
        widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoAbr +
        widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoMai +
        widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoJun +
        widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoJul +
        widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoAgo +
        widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoSete +
        widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoOutu +
        widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoNov +
        widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoDez;

    return (producao / 12);
  }

  _getRowMedia() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Text(
              'Média:',
              style: GoogleFonts.robotoMono(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white70),
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              '${_resultadoMedia().toStringAsFixed(2)}kWh',
              style: GoogleFonts.robotoMono(
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
      double altura, double largura, DimensionamentoRealizado dimensionamento) {
    return Center(
      child: Container(
        width: largura * 0.56,
        height: altura * 0.45,
        decoration: BoxDecoration(
            color: Colors.black,
            border: Border.all(width: 1),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(height: altura * 0.005),
            _getRowCadaMes(
                "Jan", dimensionamento.producaoJan, altura, largura),
            _getRowCadaMes(
                "Fev", dimensionamento.producaoFev, altura, largura),
            _getRowCadaMes(
                "Mar", dimensionamento.producaoMar, altura, largura),
            _getRowCadaMes(
                "Abr", dimensionamento.producaoAbr, altura, largura),
            _getRowCadaMes(
                "Mai", dimensionamento.producaoMai, altura, largura),
            _getRowCadaMes(
                "Jun", dimensionamento.producaoJun, altura, largura),
            _getRowCadaMes(
                "Jul", dimensionamento.producaoJul, altura, largura),
            _getRowCadaMes(
                "Ago", dimensionamento.producaoAgo, altura, largura),
            _getRowCadaMes(
                "Set", dimensionamento.producaoSete, altura, largura),
            _getRowCadaMes(
                "Out", dimensionamento.producaoOutu, altura, largura),
            _getRowCadaMes(
                "Nov", dimensionamento.producaoNov, altura, largura),
            _getRowCadaMes(
                "Dez", dimensionamento.producaoDez, altura, largura),
            _getRowMedia(),
          ],
        ),
      ),
    );
  }

  _getDadosContainer(String text, IconData icons, double altura, double largura){
    return Container(
      width: largura * 0.7,
      height: altura * 0.07,
      decoration: BoxDecoration(
        color: Colors.black,
        border: Border.all(width: 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             Icon(icons, size: 30, color:  Colors.white,),
            Text(
              text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700,color: Colors.white),) ,
          ],
        ),
      ),
    );
  }
_getBotao(bool novoDimensionamentoOuNao){
  return EasyButton(
    type: EasyButtonType.elevated,
    // Conteúdo dentro do botão quando o estado do botão está inativo.
    idleStateWidget: Text(
      novoDimensionamentoOuNao ? 'Salvar': 'Excluir',
      style: const TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.w700),
    ),
    // Conteúdo dentro do botão quando o estado do botão está sendo carregado.
    loadingStateWidget: const CircularProgressIndicator(
      strokeWidth: 3.0,
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.black,
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
    buttonColor:  Color.fromARGB(255, 255, 222, 89),
    onPressed: novoDimensionamentoOuNao ? _clickSalvar : _clickExcluir,
  );

}

  _getCaixaResultados(double sugestaoModulos, double potenciakit, double area,
      double altura, double largura) {
    return Padding(
      padding: const EdgeInsets.all(22.0),
      child: SizedBox(
        width: largura * 0.7,
        height: altura * 0.24,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _getDadosContainer("Quantidade de placas: ${sugestaoModulos.ceil().toStringAsFixed(0)}", Icons.solar_power_outlined, altura, largura),
            SizedBox(height: altura * 0.01309,),
            _getDadosContainer("Potência do KIT: ${potenciakit.toStringAsFixed(2)}(kWp)", Icons.offline_bolt_outlined, altura, largura),
            SizedBox(height: altura * 0.01309,),
            _getDadosContainer("Area ocupada: ${area.toStringAsFixed(1)} m²", Icons.straighten_outlined, altura, largura),

          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    double area = widget.dimensionamentoRealizadoEnviadoDeOutraTela.areOcupada;

    double potenciakit = widget.dimensionamentoRealizadoEnviadoDeOutraTela.potenciakit;

    double sugestaoModulos = widget.dimensionamentoRealizadoEnviadoDeOutraTela.sugestaoPlacas;

    _getESpacamentoLadosDinamica() {
      return altura * 0.025;
    }

    return Scaffold(
      backgroundColor: Colors.black,

      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Resultado do Dimensionamento',
         style: GoogleFonts.lobster(fontSize: largura * 0.85 * 0.091,
    color: Colors.black,
    fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color.fromARGB(255, 255, 222, 89),
      ),
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/image/mao_pordool.jpg'), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(_getESpacamentoLadosDinamica()), //22.0
            child: Column(
              children: [
                const Text(
                  'Geração de Energia Mensal',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.w700,color: Color.fromARGB(255, 255, 222, 89)),
                ),
                SizedBox(
                  height: altura * 0.011,
                ),
                _cardGeracaoMesMedia(altura, largura, widget.dimensionamentoRealizadoEnviadoDeOutraTela),
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
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700),
                      ),
                      // Conteúdo dentro do botão quando o estado do botão está sendo carregado.
                      loadingStateWidget: const CircularProgressIndicator(
                        strokeWidth: 3.0,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Colors.black,
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
                      buttonColor: Color.fromARGB(255, 255, 222, 89),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                    SizedBox(width: 20),
                    _getBotao(widget.novoDimensionamentoOuNao),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
