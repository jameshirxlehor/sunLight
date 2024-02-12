import 'package:flutter/material.dart';
import 'package:sunlight/widgets/styledSwitch.dart';

class NovoDimensionamento extends StatefulWidget {
  NovoDimensionamento({super.key});


  @override
  State<NovoDimensionamento> createState() => _NovoDimensionamentoState();
}


class _NovoDimensionamentoState extends State<NovoDimensionamento> {


  _click(){

  }

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
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            tituloText,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  _getTextFormFieldDados(String hintText, TextEditingController controller,
      String? Function(String?) validator, TextInputType textInputType) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.black, fontSize: 40),
        //errorText: "Campo Obrigatório",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
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

  _getMedia() {
    return Column(
      children: [
        _getSizedBox(10),
        _getTextTitulo("Fevereiro", 20),
        _getTextFormFieldDados("Insira a média do consumo",
            controllerConsumoMedia, (p0) => null, TextInputType.number)
      ],
    );
  }

  // _getTextFormFieldDados("Insira o consumo de janeiro", controllerConsumoMesJaneiro, (p0) => null, TextInputType.number);
  _getMesAMes() {
    return Column(
      children: [
        _getTextTitulo("Janeiro", 20),
        _getTextFormFieldDados("Insira o consumo de janeiro",
            controllerConsumoMesJaneiro, (p0) => null, TextInputType.number),
        _getSizedBox(10),
        _getTextTitulo("Fevereiro", 20),
        _getTextFormFieldDados("Insira o consumo de fevereiro",
            controllerConsumoMesFevereiro, (p0) => null, TextInputType.number),
        _getSizedBox(10),
        _getTextTitulo("Março", 20),
        _getTextFormFieldDados("Insira o consumo de março",
            controllerConsumoMesMarco, (p0) => null, TextInputType.number),
        _getSizedBox(10),
        _getTextTitulo("Abril", 20),
        _getTextFormFieldDados("Insira o consumo de abril",
            controllerConsumoMesAbril, (p0) => null, TextInputType.number),
        _getSizedBox(10),
        _getTextTitulo("Maio", 20),
        _getTextFormFieldDados("Insira o consumo de maio",
            controllerConsumoMesMaio, (p0) => null, TextInputType.number),
        _getSizedBox(10),
        _getTextTitulo("Junho", 20),
        _getTextFormFieldDados("Insira o consumo de junho",
            controllerConsumoMesJunho, (p0) => null, TextInputType.number),
        _getSizedBox(10),
        _getTextTitulo("Julho", 20),
        _getTextFormFieldDados("Insira o consumo de julho",
            controllerConsumoMesJulho, (p0) => null, TextInputType.number),
        _getSizedBox(10),
        _getTextTitulo("Agosto", 20),
        _getTextFormFieldDados("Insira o consumo de agosto",
            controllerConsumoMesAgosto, (p0) => null, TextInputType.number),
        _getSizedBox(10),
        _getTextTitulo("Setembro", 20),
        _getTextFormFieldDados("Insira o consumo de setembro",
            controllerConsumoMesSetembro, (p0) => null, TextInputType.number),
        _getSizedBox(10),
        _getTextTitulo("Outubro", 20),
        _getTextFormFieldDados("Insira o consumo de outubro",
            controllerConsumoMesOutubro, (p0) => null, TextInputType.number),
        _getSizedBox(10),
        _getTextTitulo("Novembro", 20),
        _getTextFormFieldDados("Insira o consumo de novembro",
            controllerConsumoMesNovembro, (p0) => null, TextInputType.number),
        _getSizedBox(10),
        _getTextTitulo("Dezembro", 20),
        _getTextFormFieldDados("Insira o consumo de dezembro",
            controllerConsumoMesDezembro, (p0) => null, TextInputType.number),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    double largura =
        MediaQuery.of(context).size.width; // tamanho da largura da tela
    double altura =
        MediaQuery.of(context).size.height; // tamanho da altura da tela

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 222, 89),
      appBar: AppBar(
        title: const Text(
          'Novo Dimensionamento',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 222, 89),
              fontWeight: FontWeight.w600,
              fontSize: 25),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            _getSizedBox(20),
            _getTextTitulo("Estado", 30),
            // DropdownButton(items: listaEstados(), onChanged: _click()),
            _getTextFormFieldDados("Insira o estado", controllerEstado,
                (p0) => null, TextInputType.emailAddress),
            _getSizedBox(40),
            _getTextTitulo("Cidade", 30),
            _getTextFormFieldDados("Insira a cidade", controllerCidade,
                (p0) => null, TextInputType.emailAddress),
            _getSizedBox(40),
            _getTextTitulo("Orientação das Placas", 30),
            _getTextFormFieldDados(
                "Insira a orientação das Placas",
                controllerOrientacaoPlaca,
                (p0) => null,
                TextInputType.emailAddress),
            _getSizedBox(40),
            _getTextTitulo("Potência da Placa", 30),
            _getTextFormFieldDados("Insira a potência da Placa",
                controllerPotenciaPlaca, (p0) => null, TextInputType.number),
            _getSizedBox(40),
            _getTextTitulo("Consumo De Energia", 30),
            _getSizedBox(20),
            Row(
              children: [
                _getTextTitulo("Mês a Mês", 25),
                StyledSwitch(onToggled: _onToggled),
                _getTextTitulo("Média", 25),
              ],
            ),
            _getSizedBox(20),
            mostrarConsumoMesAMes ? _getMesAMes() : _getMedia(),
          ],
        ),
      ),
    );
  }
}
