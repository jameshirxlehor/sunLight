import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/cardOpcaoHome.dart';
import 'package:card_swiper/card_swiper.dart';

class NovoDimensionamento extends StatefulWidget {
  const NovoDimensionamento({super.key});

  @override
  State<NovoDimensionamento> createState() => _NovoDimensionamentoState();
}

class _NovoDimensionamentoState extends State<NovoDimensionamento> {

  bool sw = true;    // atributo

  @override
  Widget build(BuildContext context) {
    double largura =
        MediaQuery.of(context).size.width; // tamanho da largura da tela
    double altura =
        MediaQuery.of(context).size.height; // tamanho da altura da tela

    TextEditingController controllerEstado = TextEditingController();
    TextEditingController controllerCidade = TextEditingController();
    TextEditingController controllerOrientacaoPlaca = TextEditingController();
    TextEditingController controllerPotenciaPlaca = TextEditingController();





    _getTextTitulo(String tituloText) {
      return Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              tituloText,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _getSizedBox(20),
              _getTextTitulo("Estado"),
              _getTextFormFieldDados("Insira o estado", controllerEstado,
                  (p0) => null, TextInputType.emailAddress),
              _getSizedBox(40),
              _getTextTitulo("Cidade"),
              _getTextFormFieldDados("Insira a cidade", controllerCidade,
                  (p0) => null, TextInputType.emailAddress),
              _getSizedBox(40),
              _getTextTitulo("Orientação das Placas"),
              _getTextFormFieldDados(
                  "Insira a orientação das Placas",
                  controllerOrientacaoPlaca,
                  (p0) => null,
                  TextInputType.emailAddress),
              _getSizedBox(40),
              _getTextTitulo("Potência da Placa"),
              _getTextFormFieldDados("Insira a potência da Placa",
                  controllerPotenciaPlaca, (p0) => null, TextInputType.number),
              _getSizedBox(20),
              Switch(
                value: sw,
                onChanged: (value) {
                  setState(() {
                    sw = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// NovoDimensionamento({required TextEditingController controllerTexto}) {
//   return
// }
