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
  @override
  Widget build(BuildContext context) {
    double largura =
        MediaQuery.of(context).size.width; // tamanho da largura da tela
    double altura =
        MediaQuery.of(context).size.height; // tamanho da altura da tela
    TextEditingController controllerTexto = TextEditingController();

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
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controllerTexto,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelStyle: TextStyle(color: Colors.black),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  hintText: 'Insira o valor',
                ),
              )
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
