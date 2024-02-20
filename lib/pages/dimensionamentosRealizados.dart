import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunlight/dao/dimensionamentodao.dart';
import 'package:sunlight/dao/impl/dimensionamento_dao_db.dart';
import 'package:sunlight/pages/resultadoDimensionamento.dart';

import '../domain/mediator.dart';
import '../model/dimensionamentorealizado.dart';

class DimensionamentosRealizados extends StatefulWidget {
  DimensionamentosRealizados({super.key});

  @override
  State<DimensionamentosRealizados> createState() =>
      _DimensionamentosRealizadosState();
}

class _DimensionamentosRealizadosState
    extends State<DimensionamentosRealizados> {
  _cardDimensionados(double largura, double altura,
      
      DimensionamentoRealizado dimensionamentoRealizado) {

    
    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultadoDimensionamento(
              dimensionamentoRealizadoEnviadoDeOutraTela:
                  dimensionamentoRealizado,
              novoDimensionamentoOuNao: false,
            ),
          ),
        );
        dimensionamentoDao.listar().then((value) {
          listaDimensionamentos = value;
          setState(() {});
        });
      },
      child: Row(
        children: [
          Expanded(
            child: Card(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 6, top: 6, left: 12),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          SizedBox(
                            width: (largura-12) * 0.65,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "${dimensionamentoRealizado.nome}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: (largura-12) * 0.11),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(dimensionamentoRealizado.data,
                                  style: TextStyle(fontSize: (largura-12) * 0.063),),
                            ],
                          ),
                          Row(
                            children: [
                              Text("${dimensionamentoRealizado.cidade}",
                                  style: TextStyle(fontSize: (largura-12) * 0.063)),
                            ],
                          ),
                          Row(
                            children: [
                              Text("${dimensionamentoRealizado.mediaConsumo} kWh",
                                  style: TextStyle(fontSize: largura * 0.063)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: (largura-12) * 0.030,
                    // ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Icon(
                            Icons.solar_power,
                            size: largura * 0.28,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  late DimensionamentoDao dimensionamentoDao;
  List<DimensionamentoRealizado> listaDimensionamentos = [];

  @override
  void initState() {
    dimensionamentoDao = DimensionamentoDaoDb(db: Mediator().db);
    dimensionamentoDao.listar().then((value) {
      listaDimensionamentos = value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double largura =
        MediaQuery.of(context).size.width; // tamanho da largura da tela
    double altura =
        MediaQuery.of(context).size.height; // tamanho da altura da tela

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        centerTitle: true,
        title: Text(
          'Realizados',
          style: GoogleFonts.lobster(
              fontSize: largura * 0.85 * 0.11,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color.fromARGB(255, 255, 222, 89),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 14.0, right: 6.0, left: 6.0),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return _cardDimensionados(
                largura, altura, listaDimensionamentos[index]);
          },
          itemCount: listaDimensionamentos.length,
        ),
      ),
    );
  }
}
