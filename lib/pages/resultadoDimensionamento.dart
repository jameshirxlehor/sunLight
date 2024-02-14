import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunlight/model/calculogeracao.dart';
import 'package:sunlight/model/producaototal.dart';

class ResultadoDimensionamento extends StatefulWidget {
  CalculoGeracao calculos;
  ResultadoDimensionamento({super.key, required this.calculos});

  @override
  State<ResultadoDimensionamento> createState() => _ResultadoDimensionamentoState();
}

class _ResultadoDimensionamentoState extends State<ResultadoDimensionamento> {
  @override
  Widget build(BuildContext context) {

    double area = widget.calculos.areaOcupada;
    double potenciakit = widget.calculos.potenciaDoKit;
    Producaototal producaototal = widget.calculos.producaoTotal;
    double sugestaoModulos = widget.calculos.sugestaoModulos;
    _media(Producaototal producaototal){
      late double prouducao = producaototal.producaoMensalJan! + producaototal.producaoMensalFev! + producaototal.producaoMensalMar! + producaototal.producaoMensalAbr! + producaototal.producaoMensalMai! + producaototal.producaoMensalJun! + producaototal.producaoMensalJul! + producaototal.producaoMensalAgo! + producaototal.producaoMensalSete! + producaototal.producaoMensalOutu! + producaototal.producaoMensalNov! + producaototal.producaoMensalDez!;
      return (prouducao / 12);
    }

    _getTableRow(String text, String geracao){
     return Row(
       mainAxisAlignment: MainAxisAlignment.center,
       children: [
         Container(
           width: 220,
           height: 30,
           decoration:  BoxDecoration(
             color: Colors.white,
             border: Border.all(width: 1)
         ),
           child: Row(
             children: [
             Container(
             width: 80,
             color: Colors.white,
                 child: Center(child: Text(text, style: const TextStyle(fontSize: 20),))

             ),
               Expanded(
                 child: Container(
                   decoration: const BoxDecoration(
                     border:Border(
                       left: BorderSide(width: 1)
                     )
                   ),
                     child: Center(child: Text(geracao, style: const TextStyle(fontSize: 20),))),
               )
           ],
           ),
         ),
       ],
     );
    }

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 222, 89),
        appBar: AppBar(
          title:  const Text('Resultado do Dimensionamento',style: TextStyle(
          color: Color.fromARGB(255, 255, 222, 89),
            fontWeight: FontWeight.w600,
            fontSize: 21),),
          backgroundColor: Colors.black,
        ),
        body: Padding(
          padding:  const EdgeInsets.all(22.0),
          child: Column(
            children: [
              Container(
                width: 220,
                  height: 30,
                  decoration:   BoxDecoration(
                      border: Border.all(width:1),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(6.0),
                        topRight: Radius.circular(6.0),
                      ),color: Colors.white

              ),child: Row(
                children: [
                  Container(
                      width: 80,
                      color: Colors.white,
                      child: const Center(child: Text('Mês', style: TextStyle(fontSize: 20),))
                  ),
                  Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            left: BorderSide(
                              width: 1
                            )
                          )
                        ),
                        child: const Center(child: Text('Geração', style: TextStyle(fontSize: 20),))),
                  )
                ],
              ),
              ),
              _getTableRow( "1", "${producaototal.producaoMensalJan!.toStringAsFixed(1)}"),
              _getTableRow( "2", "${producaototal.producaoMensalFev!.toStringAsFixed(1)}"),
              _getTableRow( "3", "${producaototal.producaoMensalMar!.toStringAsFixed(1)}"),
              _getTableRow( "4", "${producaototal.producaoMensalAbr!.toStringAsFixed(1)}"),
              _getTableRow("5","${producaototal.producaoMensalMai!.toStringAsFixed(1)}"),
              _getTableRow("6", "${producaototal.producaoMensalJun!.toStringAsFixed(1)}"),
              _getTableRow("7", "${producaototal.producaoMensalJul!.toStringAsFixed(1)}"),
              _getTableRow("8", "${producaototal.producaoMensalAgo!.toStringAsFixed(1)}"),
              _getTableRow("9", "${producaototal.producaoMensalSete!.toStringAsFixed(1)}"),
              _getTableRow("10", "${producaototal.producaoMensalOutu!.toStringAsFixed(1)}"),
              _getTableRow("11", "${producaototal.producaoMensalNov!.toStringAsFixed(1)}"),
              _getTableRow("12", "${producaototal.producaoMensalDez!.toStringAsFixed(1)}"),
              Container(
                  width: 220,
                  height: 30,
                  decoration:   BoxDecoration(
                      border: Border.all(width:1),
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(6.0), // Ajuste o raio da borda conforme necessário
                        bottomRight: Radius.circular(6.0), // Ajuste o raio da borda conforme necessário
                      ),

                      color: Colors.white
                  ),
                  child: Row(
              children: [
              Container(
              width: 80,
                  color: Colors.white,
                  child: Center(child: Text("Média", style: TextStyle(fontSize: 20),))
              ),
              Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 1)
                      ),
                    ),
                    child: Center(child: Text("${_media(producaototal).toStringAsFixed(1)}", style: TextStyle(fontSize: 20),))),
              )
            ],
          ),
              ),
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Container(
                  width: 260,height: 220,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:   Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                     Padding(
                       padding: const EdgeInsets.all(8.0),
                       child: Row(
                         children: [
                           const SizedBox(width: 15),
                           Padding(
                             padding: const EdgeInsets.all(6.0),
                             child: Image.asset("assets/image/area.png",width: 25,),
                           ),
                            Text("Quantidade de placas: ${sugestaoModulos.ceil().toStringAsFixed(0)} "),
                         ],
                       ),
                     ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [
                            const SizedBox(width: 15),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Image.asset("assets/image/potencia.png",width: 25,),
                            ),
                             Text("Potência do KIT : ${potenciakit.toStringAsFixed(2)} (kWp)"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(

                          children: [
                            const SizedBox(width: 15),
                            Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Image.asset("assets/image/placa.png",width: 45,),
                            ),

                             Text("Area ocupada: ${area.toStringAsFixed(1)} m²"),
                          ],
                        ),
                      ),
                    ],
                  ),
                  ),

              )
            ],
          ),
          ),
        );
  }
}
