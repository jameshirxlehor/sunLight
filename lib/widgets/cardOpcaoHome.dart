import 'package:flutter/cupertino.dart';

cardOpcaoHome(double largura, double altura) {
  return Center(
    child: GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: largura*0.78,
        height: altura*0.58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color.fromARGB(255, 255, 222, 89),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Novo",
              style: TextStyle(
                fontSize: largura*0.78*0.11,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              "Dimensionamento",
              style: TextStyle(
                fontSize: largura*0.78*0.11,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            Image(image: const AssetImage('assets/image/placa.png'),width: largura*0.75,height: altura*0.4,),
          ],
        ),
      ),
    ),
  );
}
