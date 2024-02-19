import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DimensionamentosRealizados extends StatefulWidget {
  DimensionamentosRealizados({super.key});

  @override
  State<DimensionamentosRealizados> createState() =>
      _DimensionamentosRealizadosState();
}

class _DimensionamentosRealizadosState
    extends State<DimensionamentosRealizados> {


  _cardDimensionados(double largura, double altura) {
    return Row(
      children: [
        Expanded(
          child: Card(
            shape: OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6, top: 6),
              child: Row(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: largura * 0.36,
                      ),
                      Row(
                        children: [
                          Text(
                            'Titulo',
                            style: TextStyle(fontSize: largura * 0.11),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Data',
                              style: TextStyle(fontSize: largura * 0.063)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Cidade',
                              style: TextStyle(fontSize: largura * 0.063)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('Consumo',
                              style: TextStyle(fontSize: largura * 0.063)),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    width: largura * 0.25,
                  ),
                  Column(
                    children: [
                      Icon(
                        Icons.solar_power,
                        size: largura * 0.30,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
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
        centerTitle: true,
        title: Text(
          'Realizados',
          style: GoogleFonts.lobster(
              fontSize: largura * 0.85 * 0.11,
              color: const Color.fromARGB(255, 255, 222, 89),
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _cardDimensionados(largura, altura),
              _cardDimensionados(largura, altura),
              _cardDimensionados(largura, altura),
              _cardDimensionados(largura, altura),
            ],
          ),
        ),
      ),
    );
  }
}
