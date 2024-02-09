import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    MaterialApp(
      home: const ResultadoDimensionamento(),
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,

    ),
  );
}

class ResultadoDimensionamento extends StatelessWidget {
  const ResultadoDimensionamento({super.key});

  @override
  Widget build(BuildContext context) {

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
            fontSize: 25),),
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
              _getTableRow( "1", "0"),
              _getTableRow( "2", "0"),
              _getTableRow( "3", "0"),
              _getTableRow( "4", "0"),
              _getTableRow("5","0"),
              _getTableRow("6", "0"),
              _getTableRow("7", "0"),
              _getTableRow("8", "0"),
              _getTableRow("9", "0"),
              _getTableRow("10", "0"),
              _getTableRow("11", "0"),
              _getTableRow("12", "0"),
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
                  child: const Center(child: Text('Média', style: TextStyle(fontSize: 20),))
              ),
              Expanded(
                child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(width: 1)
                      ),
                    ),
                    child: const Center(child: Text('0', style: TextStyle(fontSize: 20),))),
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
                           const Text("quantidade de placas: 12 "),
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
                            const Text("potência do kit : 450(kWp)"),
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

                            const Text("Area ocupada: 53 m²"),
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
