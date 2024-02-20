import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunlight/calculos/producaomensal.dart';
import 'package:sunlight/model/calculogeracao.dart';
import 'package:sunlight/pages/resultadoDimensionamento.dart';
import 'package:sunlight/widgets/styledSwitch.dart';
import 'package:sunlight/model/infocidade.dart';
import 'package:intl/intl.dart';
import '../model/dimensionamentorealizado.dart';

class NovoDimensionamento extends StatefulWidget {
  late List<String> estados;
  late Map<String, List<InfoCidade>> infocidades;

  NovoDimensionamento(
      {super.key, required this.estados, required this.infocidades});

  @override
  State<NovoDimensionamento> createState() => _NovoDimensionamentoState();
}

class _NovoDimensionamentoState extends State<NovoDimensionamento> {
  String textoDropDownEstado = "Selecione";
  String textoDropDownCidade = "Selecione";
  String dropDownMenuOrientacao = "Selecione";

  TextEditingController controllerNomeCliente = TextEditingController();
  TextEditingController controllerEstado = TextEditingController();
  TextEditingController controllerCidade = TextEditingController();
  TextEditingController controllerOrientacaoPlaca = TextEditingController();
  TextEditingController controllerPotenciaPlaca = TextEditingController();
  TextEditingController controllerConsumoMedia = TextEditingController();
  TextEditingController controllerConsumoMesJaneiro = TextEditingController();
  TextEditingController controllerConsumoMesFevereiro = TextEditingController();
  TextEditingController controllerConsumoMesMarco = TextEditingController();
  TextEditingController controllerConsumoMesAbril = TextEditingController();
  TextEditingController controllerConsumoMesMaio = TextEditingController();
  TextEditingController controllerConsumoMesJunho = TextEditingController();
  TextEditingController controllerConsumoMesJulho = TextEditingController();
  TextEditingController controllerConsumoMesAgosto = TextEditingController();
  TextEditingController controllerConsumoMesSetembro = TextEditingController();
  TextEditingController controllerConsumoMesOutubro = TextEditingController();
  TextEditingController controllerConsumoMesNovembro = TextEditingController();
  TextEditingController controllerConsumoMesDezembro = TextEditingController();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool mostrarConsumoMesAMes = false;

  _onToggled(bool isToggled) {
    setState(() {
      mostrarConsumoMesAMes = isToggled;
    });
  }

  _getTextTitulo(String tituloText, double fontSize) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(
            tituloText,
            style: TextStyle(fontSize: fontSize,
                fontWeight: FontWeight.w700,
                color: Color.fromARGB(255, 255, 222, 89)),
          ),
        ),
      ],
    );
  }

  _getDropDownMenuOrientacao(double altura) {
    List<String> items = ["Norte", "Sul", "Leste", "Oeste"];
    return DropdownButtonFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(altura * 0.038),
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(altura * 0.038),
              borderSide: BorderSide(color: Colors.black)),
          fillColor: Colors.white,
          filled: true),
      icon: Icon(Icons.compare_arrows, color: Colors.black),
      focusColor: Colors.transparent,
      menuMaxHeight: altura * 0.55,
      hint: Text(dropDownMenuOrientacao,
          style: const TextStyle(color: Colors.black)),
      dropdownColor: Colors.white,
      isExpanded: true,
      style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: altura * 0.025,
          color: Colors.black),
      items: [
        for (var item in items)
          DropdownMenuItem(
            value: item,
            child: Text('${item}'),
          )
      ],
      onChanged: (selected) {
        dropDownMenuOrientacao = selected.toString();
        setState(() {});
      },
    );
  }

  _getDropDownMenuEstado(List<String> items, double altura) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(altura * 0.038),
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(altura * 0.038),
              borderSide: BorderSide(color: Colors.black)),
          fillColor: Colors.white,
          filled: true),
      icon: Icon(Icons.map, color: Colors.black),
      focusColor: Colors.transparent,
      menuMaxHeight: altura * 0.55,
      hint: Text(textoDropDownEstado,
          style: const TextStyle(color: Colors.black)),
      dropdownColor: Colors.white,
      isExpanded: true,
      style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: altura * 0.025,
          color: Colors.black),
      items: [
        for (var item in items)
          DropdownMenuItem(
            value: item,
            child: Text('${item}'),
          )
      ],
      onChanged: (selected) {
        textoDropDownEstado = selected.toString();
        setState(() {});
      },
    );
  }

  _getDropDownMenuCidades(List<String> items, double altura) {
    return DropdownButtonFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (p0) => _validatorCidade(p0),
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(altura * 0.038),
              borderSide: BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(altura * 0.038),
              borderSide: BorderSide(color: Colors.black)),
          fillColor: Colors.white,
          filled: true),
      icon: Icon(Icons.map, color: Colors.black),
      focusColor: Colors.transparent,
      menuMaxHeight: altura * 0.55,
      hint: Text(textoDropDownCidade, style: TextStyle(color: Colors.black)),
      dropdownColor: Colors.white,
      isExpanded: true,
      style: TextStyle(
          fontWeight: FontWeight.w800,
          fontSize: altura * 0.025,
          color: Colors.black),
      value: items[0],
      items: items.map<DropdownMenuItem>((e) {
        textoDropDownCidade = items[0];
        return DropdownMenuItem(
          value: e,
          child: Text('${e}'),
        );
      }).toList(),
      onChanged: (selected) {
        textoDropDownCidade = selected.toString();
        setState(() {});
      },
    );
  }

  _getCidadesPorEstados(String estado,
      Map<String, List<InfoCidade>> infocidades) {
    List<InfoCidade> listaInfocidades = infocidades[estado]!;

    List<String> cidades = [];
    if (listaInfocidades != null) {
      cidades = listaInfocidades.map((e) => e.nome).toList();
      cidades.sort((a, b) => a.compareTo(b));
      return cidades;
    } else {
      return cidades;
    }
  }

  _getTextFormFieldDados(String hintText,
      TextEditingController controller,
      String? Function(String?) validator,
      TextInputType textInputType,
      String suffixText) {
    return TextFormField(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(
            color: Colors.black, fontSize: 40, fontWeight: FontWeight.w900),
        suffixText: suffixText,
        //errorText: "Campo Obrigatório",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      // Define o comportamento da label quando o campo está focado
      //floatingLabelBehavior: FloatingLabelBehavior.auto,
      keyboardType: textInputType,
    );
  }

  _getSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  _getMedia(double altura) {
    return Column(
      children: [
        _getSizedBox(10),
        _getTextTitulo("Média", altura * 0.029),
        _getTextFormFieldDados(
            "Insira a média de consumo",
            controllerConsumoMedia,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh")
      ],
    );
  }

  // _getTextFormFieldDados("Insira o consumo de janeiro", controllerConsumoMesJaneiro, (p0) => null, TextInputType.number);
  _getMesAMes(double altura) {
    return Column(
      children: [
        _getTextTitulo("Janeiro", altura * 0.029),
        _getTextFormFieldDados(
            "Insira o consumo de janeiro",
            controllerConsumoMesJaneiro,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh"),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Fevereiro", altura * 0.029),
        _getTextFormFieldDados(
            "Insira o consumo de fevereiro",
            controllerConsumoMesFevereiro,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh"),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Março", altura * 0.029),
        _getTextFormFieldDados(
            "Insira o consumo de março",
            controllerConsumoMesMarco,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh"),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Abril", altura * 0.029),
        _getTextFormFieldDados(
            "Insira o consumo de abril",
            controllerConsumoMesAbril,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh"),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Maio", altura * 0.029),
        _getTextFormFieldDados(
            "Insira o consumo de maio",
            controllerConsumoMesMaio,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh"),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Junho", altura * 0.029),
        _getTextFormFieldDados(
            "Insira o consumo de junho",
            controllerConsumoMesJunho,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh"),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Julho", altura * 0.029),
        _getTextFormFieldDados(
            "Insira o consumo de julho",
            controllerConsumoMesJulho,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh"),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Agosto", altura * 0.029),
        _getTextFormFieldDados(
            "Insira o consumo de agosto",
            controllerConsumoMesAgosto,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh"),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Setembro", altura * 0.029),
        _getTextFormFieldDados(
            "Insira o consumo de setembro",
            controllerConsumoMesSetembro,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh"),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Outubro", altura * 0.029),
        _getTextFormFieldDados(
            "Insira o consumo de outubro",
            controllerConsumoMesOutubro,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh"),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Novembro", altura * 0.029),
        _getTextFormFieldDados(
            "Insira o consumo de novembro",
            controllerConsumoMesNovembro,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh"),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Dezembro", altura * 0.029),
        _getTextFormFieldDados(
            "Insira o consumo de dezembro",
            controllerConsumoMesDezembro,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh"),
      ],
    );
  }

  _validatorNome(valor) {
    if (valor.isEmpty) {
      return 'Por favor insira o nome';
    } else {
      return null;
    }
  }

  _validatorPotenciaPlaca(valor) {
    if (valor.isEmpty) {
      return 'Por favor insira a potência da placa';
    } else {
      return null;
    }
  }

  _validatorConsumos(valor) {
    if (valor.isEmpty) {
      return 'Por favor insira o valor';
    } else {
      return null;
    }
  }

  _validatorEstado(valor) {
    if (valor.isEmpty) {
      return 'Por favor insira o Estado';
    } else {
      return null;
    }
  }

  _validatorCidade(valor) {
    if (valor.isEmpty) {
      return 'Por favor insira a Cidade';
    } else {
      return null;
    }
  }

  _converteDateTimePString() {
    DateTime dataHoje = DateTime.now();
    String dataString = DateFormat('dd/MM/yyyy').format(dataHoje);
    return dataString;
  }

  _validaCampo() {}

  _clickCalcular() {
    if (_formKey.currentState!.validate() &&
        dropDownMenuOrientacao != 'Selecione') {
      List? infocidadeslocal = widget.infocidades[textoDropDownEstado];
      late InfoCidade informacoescidade;
      for (int i = 0; i < infocidadeslocal!.length; i++) {
        if (infocidadeslocal[i].nome == textoDropDownCidade) {
          informacoescidade = infocidadeslocal[i];
        }
      }

      List? consumoMesAMes = [
        controllerConsumoMesJaneiro.text,
        controllerConsumoMesFevereiro.text,
        controllerConsumoMesMarco.text,
        controllerConsumoMesAbril.text,
        controllerConsumoMesMaio.text,
        controllerConsumoMesJunho.text,
        controllerConsumoMesJulho.text,
        controllerConsumoMesAgosto.text,
        controllerConsumoMesSetembro.text,
        controllerConsumoMesOutubro.text,
        controllerConsumoMesNovembro.text,
        controllerConsumoMesDezembro.text
      ];
      int potenciaplaca = int.parse(controllerPotenciaPlaca.text);
      double rendimentoSistema =
      _rendimentoSistema(informacoescidade, dropDownMenuOrientacao);
      double mediaConsumoCliente = controllerConsumoMedia.text == ''
          ? _mediaConsumo(consumoMesAMes)
          : double.parse(controllerConsumoMedia.text.replaceAll(',', '.'));

      CalculoGeracao calculogerado = producaoMensal(informacoescidade,
          potenciaplaca, rendimentoSistema, mediaConsumoCliente);

      DimensionamentoRealizado dimensionamentoRealizado =
      DimensionamentoRealizado(
          nome: controllerNomeCliente.text,
          data: _converteDateTimePString(),
          estado: textoDropDownEstado,
          cidade: textoDropDownCidade,
          orientacaoPlacas: dropDownMenuOrientacao,
          potenciaPlaca: int.parse(controllerPotenciaPlaca.text),
          mesOuMedia: mostrarConsumoMesAMes,
          mediaConsumo: controllerConsumoMedia.text == ''
              ? null
              : double.parse(controllerConsumoMedia.text.replaceAll(',', '.')),
          jan: controllerConsumoMesJaneiro.text == ''
              ? null
              : double.parse(
              controllerConsumoMesJaneiro.text.replaceAll(',', '.')),
          fev: controllerConsumoMesFevereiro.text == ''
              ? null
              : double.parse(
              controllerConsumoMesFevereiro.text.replaceAll(',', '.')),
          mar: controllerConsumoMesMarco.text == ''
              ? null
              : double.parse(
              controllerConsumoMesMarco.text.replaceAll(',', '.')),
          abr: controllerConsumoMesAbril.text == ''
              ? null
              : double.parse(
              controllerConsumoMesAbril.text.replaceAll(',', '.')),
          mai: controllerConsumoMesMaio.text == ''
              ? null
              : double.parse(
              controllerConsumoMesMaio.text.replaceAll(',', '.')),
          jun: controllerConsumoMesJunho.text == ''
              ? null
              : double.parse(
              controllerConsumoMesJunho.text.replaceAll(',', '.')),
          jul: controllerConsumoMesJulho.text == ''
              ? null
              : double.parse(
              controllerConsumoMesJulho.text.replaceAll(',', '.')),
          ago: controllerConsumoMesAgosto.text == ''
              ? null
              : double.parse(
              controllerConsumoMesAgosto.text.replaceAll(',', '.')),
          sete: controllerConsumoMesSetembro.text == ''
              ? null
              : double.parse(
              controllerConsumoMesSetembro.text.replaceAll(',', '.')),
          outu: controllerConsumoMesOutubro.text == ''
              ? null
              : double.parse(
              controllerConsumoMesOutubro.text.replaceAll(',', '.')),
          nov: controllerConsumoMesNovembro.text == ''
              ? null
              : double.parse(
              controllerConsumoMesNovembro.text.replaceAll(',', '.')),
          dez: controllerConsumoMesDezembro.text == ''
              ? null
              : double.parse(
              controllerConsumoMesDezembro.text.replaceAll(',', '.')),
          areOcupada: calculogerado.areaOcupada,
          potenciakit: calculogerado.potenciaDoKit,
          sugestaoPlacas: calculogerado.sugestaoModulos,
          producaoJan: calculogerado.producaoTotal.producaoMensalJan,
          producaoFev: calculogerado.producaoTotal.producaoMensalFev,
          producaoMar: calculogerado.producaoTotal.producaoMensalMar,
          producaoAbr: calculogerado.producaoTotal.producaoMensalAbr,
          producaoMai: calculogerado.producaoTotal.producaoMensalMai,
          producaoJun: calculogerado.producaoTotal.producaoMensalJun,
          producaoJul: calculogerado.producaoTotal.producaoMensalJul,
          producaoAgo: calculogerado.producaoTotal.producaoMensalAgo,
          producaoSete: calculogerado.producaoTotal.producaoMensalSete,
          producaoOutu: calculogerado.producaoTotal.producaoMensalOutu,
          producaoNov: calculogerado.producaoTotal.producaoMensalNov,
          producaoDez: calculogerado.producaoTotal.producaoMensalDez
      );

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ResultadoDimensionamento(
                    dimensionamentoRealizadoEnviadoDeOutraTela:
                    dimensionamentoRealizado, novoDimensionamentoOuNao: true,
                  )));
    }
  }

  _rendimentoSistema(InfoCidade informacoescidade, String orietacaoPlacas) {
    double latitude = informacoescidade.latitude;
    double rendimento = 1;

    if (0 >= latitude && latitude <= 5) {
      rendimento = 0.80;
    }
    if (5 > latitude && latitude <= 10) {
      if (orietacaoPlacas == "Norte") {
        rendimento = 0.80;
      }
      if (orietacaoPlacas == "Sul") {
        rendimento = 0.75;
      }
      if (orietacaoPlacas == "Leste") {
        rendimento = 0.77;
      }
      if (orietacaoPlacas == "Oeste") {
        rendimento = 0.77;
      }
    }
    if (10 > latitude && latitude <= 15) {
      if (orietacaoPlacas == "Norte") {
        rendimento = 0.80;
      }
      if (orietacaoPlacas == "Sul") {
        rendimento = 0.71;
      }
      if (orietacaoPlacas == "Leste") {
        rendimento = 0.76;
      }
      if (orietacaoPlacas == "Oeste") {
        rendimento = 0.76;
      }
    }
    if (15 > latitude && latitude <= 20) {
      if (orietacaoPlacas == "Norte") {
        rendimento = 0.80;
      }
      if (orietacaoPlacas == "Sul") {
        rendimento = 0.68;
      }
      if (orietacaoPlacas == "Leste") {
        rendimento = 0.74;
      }
      if (orietacaoPlacas == "Oeste") {
        rendimento = 0.74;
      }
    }
    if (20 > latitude && latitude <= 25) {
      if (orietacaoPlacas == "Norte") {
        rendimento = 0.80;
      }
      if (orietacaoPlacas == "Sul") {
        rendimento = 0.65;
      }
      if (orietacaoPlacas == "Leste") {
        rendimento = 0.72;
      }
      if (orietacaoPlacas == "Oeste") {
        rendimento = 0.72;
      }
    }
    if (25 > latitude && latitude <= 30) {
      if (orietacaoPlacas == "Norte") {
        rendimento = 0.80;
      }
      if (orietacaoPlacas == "Sul") {
        rendimento = 0.62;
      }
      if (orietacaoPlacas == "Leste") {
        rendimento = 0.70;
      }
      if (orietacaoPlacas == "Oeste") {
        rendimento = 0.70;
      }
    }
    if (30 > latitude && latitude <= 35) {
      if (orietacaoPlacas == "Norte") {
        rendimento = 0.80;
      }
      if (orietacaoPlacas == "Sul") {
        rendimento = 0.60;
      }
      if (orietacaoPlacas == "Leste") {
        rendimento = 0.68;
      }
      if (orietacaoPlacas == "Oeste") {
        rendimento = 0.68;
      }
    }

    return rendimento;
  }

  _mediaConsumo(List consumoMesAMes) {
    double result = 0;
    for (int i = 0; i < consumoMesAMes.length; i++) {
      result = result + double.parse(consumoMesAMes[i]);
    }
    return result / 12;
  }

  @override
  Widget build(BuildContext context) {
    double largura =
        MediaQuery
            .of(context)
            .size
            .width; // tamanho da largura da tela
    double altura = MediaQuery
        .of(context)
        .size
        .height; // tamanho da altura da
    _getAltura() {
      return altura * 0.02;
    }

    _getLargura() {
      return largura * 0.04;
    }

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          'Novo Dimensionamento',
          style: GoogleFonts.lobster(
              fontSize: largura * 0.85 * 0.091,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color.fromARGB(255, 255, 222, 89),
      ),
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(
            image: AssetImage('assets/image/preto.jpg'),
            fit: BoxFit.cover),),
        child: Padding(
          padding: EdgeInsets.only(left: _getLargura(), right: _getLargura()),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  _getSizedBox(_getAltura()),
                  _getTextTitulo("Nome Cliente", altura * 0.03),
                  _getTextFormFieldDados(
                      "Insira o nome do cliente",
                      controllerNomeCliente,
                          (p0) => _validatorNome(p0),
                      TextInputType.emailAddress,
                      ""),
                  _getSizedBox(_getAltura()),
                  _getTextTitulo("Estado", altura * 0.03),
                  _getDropDownMenuEstado(widget.estados, altura),
                  // DropdownButton(items: listaEstados(), onChanged: _click()),
                  // _getTextFormFieldDados("Insira o estado", controllerEstado,
                  //     (p0) => null, TextInputType.emailAddress, ""),
                  _getSizedBox(_getAltura()),
                  _getTextTitulo("Cidade", altura * 0.03),
                  _getDropDownMenuCidades(
                      textoDropDownEstado == 'Selecione'
                          ? ['']
                          : _getCidadesPorEstados(
                          textoDropDownEstado, widget.infocidades),
                      altura),
                  // _getTextFormFieldDados("Insira a cidade", controllerCidade,
                  //     (p0) => null, TextInputType.emailAddress, ""),
                  _getSizedBox(_getAltura()),
                  _getTextTitulo("Orientação das Placas", altura * 0.03),
                  _getDropDownMenuOrientacao(altura),
                  _getSizedBox(_getAltura()),
                  _getTextTitulo("Potência da Placa", altura * 0.03),
                  _getTextFormFieldDados(
                      "Insira a potência da Placa",
                      controllerPotenciaPlaca,
                          (p0) => _validatorPotenciaPlaca(p0),
                      TextInputType.number,
                      "W"),
                  _getSizedBox(_getAltura()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _getTextTitulo("Consumo De Energia", altura * 0.031),
                    ],
                  ),
                  _getSizedBox(_getAltura()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _getTextTitulo("Mês a Mês", altura * 0.029),
                      StyledSwitch(onToggled: _onToggled),
                      _getTextTitulo("Média", altura * 0.029),
                    ],
                  ),
                  _getSizedBox(_getAltura()),
                  mostrarConsumoMesAMes ? _getMesAMes(altura) : _getMedia(
                      altura),
                  _getSizedBox(_getAltura()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      EasyButton(
                        type: EasyButtonType.elevated,
                        // Conteúdo dentro do botão quando o estado do botão está inativo.
                        idleStateWidget: const Text(
                          'Calcular',
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
                        onPressed: _clickCalcular,
                      ),
                    ],
                  ),
                  _getSizedBox(_getAltura()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
