
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunlight/dao/dimensionamentodao.dart';
import 'package:sunlight/dao/impl/dimensionamento_dao_db.dart';
import 'package:sunlight/pages/novoDimensionamento.dart';
import 'package:sunlight/pages/resultadoDimensionamento.dart';
import '../dao/impl/infocidade_dao_mem.dart';
import '../domain/mediator.dart';
import '../model/dimensionamentorealizado.dart';
import '../model/infocidade.dart';

class DimensionamentosRealizados extends StatefulWidget {
  const DimensionamentosRealizados({super.key});

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
              editarOuNao: true,
              listaEstado: listaEstado, infoCidade: infoCidade
              ,
            ),
          ),
        );
        dimensionamentoDao.listar().then((value) {
          listaDimensionamentos = value;
          setState(() {});
        });
      },
      onLongPress: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NovoDimensionamento(estados: listaEstado, infocidades: infoCidade,editarOuNao: true,dimensionamentoSalvo: dimensionamentoRealizado,)
          ),
        );
      },
      child: Row(
        children: [
          Expanded(
            child: Card(
              shape:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(25)),
              color: const Color.fromARGB(195, 255, 255, 255),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10, top: 6, left: 14),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  dimensionamentoRealizado.nome,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.inter(
                                      fontSize: (largura - 12) * 0.075,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                  // style: TextStyle(fontSize: (largura-12) * 0.095),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                dimensionamentoRealizado.data,
                                style: GoogleFonts.inter(
                                    fontSize: (largura - 12) * 0.04,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                              // style: TextStyle(fontSize: (largura-12) * 0.063),),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                dimensionamentoRealizado.cidade,
                                style: GoogleFonts.inter(
                                    fontSize: (largura - 12) * 0.04,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                                // style:
                                //     TextStyle(fontSize: (largura - 12) * 0.063),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                "${dimensionamentoRealizado.mediaConsumo} kWh",
                                style: GoogleFonts.inter(
                                    fontSize: (largura - 12) * 0.04,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),

                                // style: TextStyle(fontSize: largura * 0.063),
                              ),
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
                            Icons.solar_power_outlined,
                            size: largura * 0.24,
                            color: Colors.black,
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
  List<String> listaEstado = [];
  late Map<String, List<InfoCidade>> infoCidade;

  @override
  void initState() {
    dimensionamentoDao = DimensionamentoDaoDb(db: Mediator().db);
    dimensionamentoDao.listar().then((value) async{
      listaDimensionamentos = value;
      var mediator = Mediator();

      mediator.mapaCidades = await InfoCidadeDaoMem().listarCidades();

      listaEstado = mediator.mapaCidades.keys.toList();
      infoCidade = mediator.mapaCidades;


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
              'Realizados',
              style: GoogleFonts.lobster(
                  fontSize: largura * 0.85 * 0.11,
                  color: const Color.fromARGB(255, 255, 222, 89),
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        backgroundColor: Colors.blueGrey[900],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.blueGrey[900]),
        child: Padding(
          padding: const EdgeInsets.only(top: 14.0, right: 6.0, left: 6.0),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return _cardDimensionados(largura, altura, listaDimensionamentos[index]);
            },
            itemCount: listaDimensionamentos.length,
          ),
        ),
      ),
    );
  }
}
