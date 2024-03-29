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
  late bool editarOuNao;
  DimensionamentoRealizado? dimensionamentoSalvo;


  NovoDimensionamento(
      {super.key, required this.estados, required this.infocidades, required this.editarOuNao, this.dimensionamentoSalvo});

  @override
  State<NovoDimensionamento> createState() => _NovoDimensionamentoState();
}

class _NovoDimensionamentoState extends State<NovoDimensionamento> {
  @override
  void initState() {
    textoDropDownEstado =
    widget.editarOuNao ? widget.dimensionamentoSalvo!.estado : "Selecione";
    textoDropDownCidade =
    widget.editarOuNao ? widget.dimensionamentoSalvo!.cidade : "Selecione";
    dropDownMenuOrientacao = widget.editarOuNao
        ? widget.dimensionamentoSalvo!.orientacaoPlacas
        : "Selecione";

    controllerNomeCliente = TextEditingController();
    controllerEstado = TextEditingController();
    controllerCidade = TextEditingController();
    controllerOrientacaoPlaca = TextEditingController();
    controllerPotenciaPlaca = TextEditingController();
    controllerConsumoMedia = TextEditingController();
    controllerConsumoMesJaneiro = TextEditingController();
    controllerConsumoMesFevereiro = TextEditingController();
    controllerConsumoMesMarco = TextEditingController();
    controllerConsumoMesAbril = TextEditingController();
    controllerConsumoMesMaio = TextEditingController();
    controllerConsumoMesJunho = TextEditingController();
    controllerConsumoMesJulho = TextEditingController();
    controllerConsumoMesAgosto = TextEditingController();
    controllerConsumoMesSetembro = TextEditingController();
    controllerConsumoMesOutubro = TextEditingController();
    controllerConsumoMesNovembro = TextEditingController();
    controllerConsumoMesDezembro = TextEditingController();
    _formKey = GlobalKey<FormState>();

    controllerNomeCliente.text =
    widget.editarOuNao ? widget.dimensionamentoSalvo!.nome : '';
    controllerConsumoMedia.text =
    widget.editarOuNao ? (widget.dimensionamentoSalvo!.mediaConsumo == null
        ? ''
        : '${widget.dimensionamentoSalvo!.mediaConsumo}') : '';
    controllerConsumoMesJaneiro.text =
    widget.editarOuNao ? (widget.dimensionamentoSalvo!.jan == null
        ? ''
        : '${widget.dimensionamentoSalvo!.jan}') : '';
    controllerConsumoMesFevereiro.text =
    widget.editarOuNao ? (widget.dimensionamentoSalvo!.fev == null
        ? ''
        : '${widget.dimensionamentoSalvo!.fev}') : '';
    controllerConsumoMesMarco.text =
    widget.editarOuNao ? (widget.dimensionamentoSalvo!.mar == null
        ? ''
        : '${widget.dimensionamentoSalvo!.mar}') : '';
    controllerConsumoMesAbril.text =
    widget.editarOuNao ? (widget.dimensionamentoSalvo!.abr == null
        ? ''
        : '${widget.dimensionamentoSalvo!.abr}') : '';
    controllerConsumoMesMaio.text =
    widget.editarOuNao ? (widget.dimensionamentoSalvo!.mai == null
        ? ''
        : '${widget.dimensionamentoSalvo!.mai}') : '';
    controllerConsumoMesJunho.text =
    widget.editarOuNao ? (widget.dimensionamentoSalvo!.jun == null
        ? ''
        : '${widget.dimensionamentoSalvo!.jun}') : '';
    controllerConsumoMesJulho.text =
    widget.editarOuNao ? (widget.dimensionamentoSalvo!.jul == null
        ? ''
        : '${widget.dimensionamentoSalvo!.jul}') : '';
    controllerConsumoMesAgosto.text =
    widget.editarOuNao ? (widget.dimensionamentoSalvo!.ago == null
        ? ''
        : '${widget.dimensionamentoSalvo!.ago}') : '';
    controllerConsumoMesSetembro.text =
    widget.editarOuNao ? (widget.dimensionamentoSalvo!.sete == null
        ? ''
        : '${widget.dimensionamentoSalvo!.sete}') : '';
    controllerConsumoMesOutubro.text =
    widget.editarOuNao ? (widget.dimensionamentoSalvo!.outu == null
        ? ''
        : '${widget.dimensionamentoSalvo!.outu}') : '';
    controllerConsumoMesNovembro.text =
    widget.editarOuNao ? (widget.dimensionamentoSalvo!.nov == null
        ? ''
        : '${widget.dimensionamentoSalvo!.nov}') : '';
    controllerConsumoMesDezembro.text =
    widget.editarOuNao ? (widget.dimensionamentoSalvo!.dez == null
        ? ''
        : '${widget.dimensionamentoSalvo!.dez}') : '';
    controllerPotenciaPlaca.text =
    widget.editarOuNao ? ('${widget.dimensionamentoSalvo!.potenciaPlaca}') : '';
    mostrarConsumoMesAMes =
    widget.editarOuNao ? (widget.dimensionamentoSalvo!.mesOuMedia) : false;

    super.initState();
  }

  late String textoDropDownEstado;
  late String textoDropDownCidade;
  late String dropDownMenuOrientacao;

  late TextEditingController controllerNomeCliente;
  late TextEditingController controllerEstado;
  late TextEditingController controllerCidade;
  late TextEditingController controllerOrientacaoPlaca;
  late TextEditingController controllerPotenciaPlaca;
  late TextEditingController controllerConsumoMedia;
  late TextEditingController controllerConsumoMesJaneiro;
  late TextEditingController controllerConsumoMesFevereiro;
  late TextEditingController controllerConsumoMesMarco;
  late TextEditingController controllerConsumoMesAbril;
  late TextEditingController controllerConsumoMesMaio;
  late TextEditingController controllerConsumoMesJunho;
  late TextEditingController controllerConsumoMesJulho;
  late TextEditingController controllerConsumoMesAgosto;
  late TextEditingController controllerConsumoMesSetembro;
  late TextEditingController controllerConsumoMesOutubro;
  late TextEditingController controllerConsumoMesNovembro;
  late TextEditingController controllerConsumoMesDezembro;
  late GlobalKey<FormState> _formKey;
  late bool mostrarConsumoMesAMes;

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
            style: GoogleFonts.inter(fontSize: fontSize,
                fontWeight: FontWeight.w600,
                color: Colors.white),
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
              borderSide: const BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(altura * 0.038),
              borderSide: const BorderSide(color: Colors.black)),
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(13),
          filled: true),
      icon: const Icon(Icons.compare_arrows, color: Colors.black),
      focusColor: Colors.transparent,
      menuMaxHeight: altura * 0.55,
      hint: Text(dropDownMenuOrientacao,
          style:  GoogleFonts.inter(color: Colors.black)),
      dropdownColor: Colors.white,
      isExpanded: true,
      style: GoogleFonts.inter(
          fontSize: altura * 0.0201,
          color: Colors.black),
      items: [
        for (var item in items)
          DropdownMenuItem(
            value: item,
            child: Text(item),
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
              borderSide: const BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(altura * 0.038),
              borderSide: const BorderSide(color: Colors.black)),
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(13),
          filled: true),
      icon: const Icon(Icons.map, color: Colors.black),
      focusColor: Colors.transparent,
      menuMaxHeight: altura * 0.55,
      hint: Text(textoDropDownEstado,
          style:  GoogleFonts.inter(color: Colors.black)),
      dropdownColor: Colors.white,
      isExpanded: true,
      style: GoogleFonts.inter(
          fontSize: altura * 0.0201,
          color: Colors.black),
      items: [
        for (var item in items)
          DropdownMenuItem(
            value: item,
            child: Text(item),
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
              borderSide: const BorderSide(color: Colors.black)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(altura * 0.038),
              borderSide: const BorderSide(color: Colors.black)),
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.all(13),
          filled: true),
      icon: const Icon(Icons.map, color: Colors.black),
      focusColor: Colors.transparent,
      menuMaxHeight: altura * 0.55,
      hint: Text(textoDropDownCidade, style:  GoogleFonts.inter(color: Colors.black)),
      dropdownColor: Colors.white,
      isExpanded: true,
      style: GoogleFonts.inter(
          fontSize: altura * 0.0201,
          color: Colors.black),
      value: items[0],
      items: items.map<DropdownMenuItem>((e) {
        return DropdownMenuItem(
          value: e,
          child: Text(e),
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
      String suffixText, double Altura) {
    return TextFormField(
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: GoogleFonts.inter(
            color: Colors.black,),
        filled: true,
        fillColor: Colors.white,
        suffixText: suffixText,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(30),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        isDense: true,
        contentPadding: EdgeInsets.all(15),
      ),
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
        _getTextTitulo("Média", altura * 0.025),
        _getTextFormFieldDados(
            "Insira a média de consumo",
            controllerConsumoMedia,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh", altura)
      ],
    );
  }

  // _getTextFormFieldDados("Insira o consumo de janeiro", controllerConsumoMesJaneiro, (p0) => null, TextInputType.number);
  _getMesAMes(double altura) {
    return Column(
      children: [
        _getTextTitulo("Janeiro", altura * 0.025),
        _getTextFormFieldDados(
            "Insira o consumo de janeiro",
            controllerConsumoMesJaneiro,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh", altura),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Fevereiro", altura * 0.025),
        _getTextFormFieldDados(
            "Insira o consumo de fevereiro",
            controllerConsumoMesFevereiro,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh", altura),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Março", altura * 0.025),
        _getTextFormFieldDados(
            "Insira o consumo de março",
            controllerConsumoMesMarco,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh", altura),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Abril", altura * 0.025),
        _getTextFormFieldDados(
            "Insira o consumo de abril",
            controllerConsumoMesAbril,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh", altura),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Maio", altura * 0.025),
        _getTextFormFieldDados(
            "Insira o consumo de maio",
            controllerConsumoMesMaio,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh", altura),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Junho", altura * 0.025),
        _getTextFormFieldDados(
            "Insira o consumo de junho",
            controllerConsumoMesJunho,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh", altura),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Julho", altura * 0.025),
        _getTextFormFieldDados(
            "Insira o consumo de julho",
            controllerConsumoMesJulho,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh", altura),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Agosto", altura * 0.025),
        _getTextFormFieldDados(
            "Insira o consumo de agosto",
            controllerConsumoMesAgosto,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh", altura),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Setembro", altura * 0.025),
        _getTextFormFieldDados(
            "Insira o consumo de setembro",
            controllerConsumoMesSetembro,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh", altura),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Outubro", altura * 0.025),
        _getTextFormFieldDados(
            "Insira o consumo de outubro",
            controllerConsumoMesOutubro,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh", altura),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Novembro", altura * 0.025),
        _getTextFormFieldDados(
            "Insira o consumo de novembro",
            controllerConsumoMesNovembro,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh", altura),
        _getSizedBox(altura * 0.011),
        _getTextTitulo("Dezembro", altura * 0.025),
        _getTextFormFieldDados(
            "Insira o consumo de dezembro",
            controllerConsumoMesDezembro,
                (p0) => _validatorConsumos(p0),
            TextInputType.number,
            "kWh", altura),
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
          id: widget.editarOuNao ? widget.dimensionamentoSalvo!.id : null,
          nome: controllerNomeCliente.text,
          data: _converteDateTimePString(),
          estado: textoDropDownEstado,
          cidade: textoDropDownCidade,
          orientacaoPlacas: dropDownMenuOrientacao,
          potenciaPlaca: int.parse(controllerPotenciaPlaca.text),
          mesOuMedia: mostrarConsumoMesAMes,
          mediaConsumo: controllerConsumoMedia.text == '' ||
              controllerConsumoMedia.text == 'null'
              ? null
              : double.parse(controllerConsumoMedia.text.replaceAll(',', '.')),
          jan: controllerConsumoMesJaneiro.text == '' ||
              controllerConsumoMesJaneiro.text == 'null'
              ? null
              : double.parse(
              controllerConsumoMesJaneiro.text.replaceAll(',', '.')),
          fev: controllerConsumoMesFevereiro.text == '' ||
              controllerConsumoMesFevereiro.text == 'null'
              ? null
              : double.parse(
              controllerConsumoMesFevereiro.text.replaceAll(',', '.')),
          mar: controllerConsumoMesMarco.text == '' ||
              controllerConsumoMesMarco.text == 'null'
              ? null
              : double.parse(
              controllerConsumoMesMarco.text.replaceAll(',', '.')),
          abr: controllerConsumoMesAbril.text == '' ||
              controllerConsumoMesAbril.text == 'null'
              ? null
              : double.parse(
              controllerConsumoMesAbril.text.replaceAll(',', '.')),
          mai: controllerConsumoMesMaio.text == '' ||
              controllerConsumoMesMaio.text == 'null'
              ? null
              : double.parse(
              controllerConsumoMesMaio.text.replaceAll(',', '.')),
          jun: controllerConsumoMesJunho.text == '' ||
              controllerConsumoMesJunho.text == 'null'
              ? null
              : double.parse(
              controllerConsumoMesJunho.text.replaceAll(',', '.')),
          jul: controllerConsumoMesJulho.text == '' ||
              controllerConsumoMesJulho.text == 'null'
              ? null
              : double.parse(
              controllerConsumoMesJulho.text.replaceAll(',', '.')),
          ago: controllerConsumoMesAgosto.text == '' ||
              controllerConsumoMesAgosto.text == 'null'
              ? null
              : double.parse(
              controllerConsumoMesAgosto.text.replaceAll(',', '.')),
          sete: controllerConsumoMesSetembro.text == '' ||
              controllerConsumoMesSetembro.text == 'null'
              ? null
              : double.parse(
              controllerConsumoMesSetembro.text.replaceAll(',', '.')),
          outu: controllerConsumoMesOutubro.text == '' ||
              controllerConsumoMesOutubro.text == 'null'
              ? null
              : double.parse(
              controllerConsumoMesOutubro.text.replaceAll(',', '.')),
          nov: controllerConsumoMesNovembro.text == '' ||
              controllerConsumoMesNovembro.text == 'null'
              ? null
              : double.parse(
              controllerConsumoMesNovembro.text.replaceAll(',', '.')),
          dez: controllerConsumoMesDezembro.text == '' ||
              controllerConsumoMesDezembro.text == 'null'
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
                dimensionamentoRealizado,
                novoDimensionamentoOuNao: true,
                editarOuNao: widget.editarOuNao,
                listaEstado: widget.estados,
                infoCidade: widget.infocidades,
              ),),);
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
      return altura * 0.03;
    }

    _getLargura() {
      return largura * 0.04;
    }

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Color.fromARGB(255, 255, 222, 89),
        ),
        title: Row(
          children: [
            Image.asset(
              'assets/image/Sunlight_logo.png',
              height: altura * 0.04,
            ),
            SizedBox(width: largura * 0.05,),
            Text(
              'Dimensionar',
              style: GoogleFonts.lobster(
                  fontSize: largura * 0.85 * 0.11,
                  color: const Color.fromARGB(255, 255, 222, 89),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Padding(
        padding: EdgeInsets.only(left: _getLargura(), right: _getLargura()),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                _getSizedBox(_getAltura()),
                _getTextTitulo("Nome Cliente", altura * 0.025),
                _getTextFormFieldDados(
                    "Insira o nome do cliente",
                    controllerNomeCliente,
                        (p0) => _validatorNome(p0),
                    TextInputType.emailAddress,
                    "", altura),
                _getSizedBox(_getAltura()),
                _getTextTitulo("Estado", altura * 0.025),
                _getDropDownMenuEstado(widget.estados, altura),
                // DropdownButton(items: listaEstados(), onChanged: _click()),
                // _getTextFormFieldDados("Insira o estado", controllerEstado,
                //     (p0) => null, TextInputType.emailAddress, ""),
                _getSizedBox(_getAltura()),
                _getTextTitulo("Cidade", altura * 0.025),
                _getDropDownMenuCidades(
                    textoDropDownEstado == 'Selecione'
                        ? ['']
                        : _getCidadesPorEstados(
                        textoDropDownEstado, widget.infocidades),
                    altura),
                // _getTextFormFieldDados("Insira a cidade", controllerCidade,
                //     (p0) => null, TextInputType.emailAddress, ""),
                _getSizedBox(_getAltura()),
                _getTextTitulo("Orientação das Placas", altura * 0.025),
                _getDropDownMenuOrientacao(altura),
                _getSizedBox(_getAltura()),
                _getTextTitulo("Potência da Placa", altura * 0.025),
                _getTextFormFieldDados(
                    "Insira a potência da Placa",
                    controllerPotenciaPlaca,
                        (p0) => _validatorPotenciaPlaca(p0),
                    TextInputType.number,
                    "W", altura),
                _getSizedBox(_getAltura()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _getTextTitulo("Consumo De Energia", altura * 0.025),
                  ],
                ),
                _getSizedBox(_getAltura()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _getTextTitulo("Mês a Mês", altura * 0.025),
                    StyledSwitch(onToggled: _onToggled),
                    _getTextTitulo("Média", altura * 0.025),
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
                            fontWeight: FontWeight.w900),
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
                      width: 360.0,
                      height: 45.0,
                      borderRadius: 30.0,
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
                      buttonColor: const Color.fromARGB(255, 255, 222, 89),
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
    );
  }
}
