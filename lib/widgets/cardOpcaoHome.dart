import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

cardOpcaoHome(
    {required double largura,
    required double altura,
    required String palavraPrimaria,
    required String palavraSecundaria,
    required String urlImagem, double larguraIcon = 0.75, double alturaIcon = 0.4, required click()}) {
  return Center(
    child: GestureDetector(
      onTap: click,
      child: Card(
        borderOnForeground: true,
        elevation: 3,
        shadowColor: const Color.fromARGB(255, 255, 222, 89),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: const Color.fromARGB(255, 255, 222, 89),
        child: SizedBox(
          width: largura * 0.85,
          height: altura * 0.58,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                palavraPrimaria,
                style: TextStyle(
                  fontSize: largura * 0.78 * 0.105,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                palavraSecundaria,
                style: TextStyle(
                  fontSize: largura * 0.78 * 0.105,
                  fontWeight: FontWeight.w900,
                ),
                textAlign: TextAlign.center,
              ),
              Image(
                image: AssetImage(urlImagem),
                width: largura * larguraIcon,
                height: altura * alturaIcon,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
