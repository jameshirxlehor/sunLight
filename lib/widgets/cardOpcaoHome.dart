import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


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
        shadowColor:  Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40),
        ),
        color: const Color.fromRGBO(0, 0, 0, 99),
        child: SizedBox(
          width: largura * 0.89,
          height: altura * 0.61,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: largura * 0.79,
                height: altura * 0.46,
                // color: Colors.white,
                decoration: BoxDecoration(image: DecorationImage(image: AssetImage(urlImagem), fit: BoxFit.cover),borderRadius: BorderRadius.circular(20)),
                // child: Image(
                //     image: AssetImage(urlImagem),
                //     width: largura * larguraIcon,
                //     height: altura * alturaIcon,
                //     color: Color.fromARGB(255, 255, 222, 89),
                //   ),
                // decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/image/page1.png'), fit: BoxFit.cover)),
              ),
              Text(
                palavraPrimaria,
                style: GoogleFonts.playball(fontSize: largura * 0.85 * 0.11,color: Color.fromARGB(255, 255, 222, 89)),
                // style: TextStyle(
                //   fontSize: largura * 0.78 * 0.105,
                //   fontWeight: FontWeight.w900,
                // ),
                textAlign: TextAlign.center,
              ),
              Text(
                palavraSecundaria,
                style: GoogleFonts.playball(fontSize: largura * 0.85 * 0.11,color: Color.fromARGB(255, 255, 222, 89)),
                // style: TextStyle(
                //   fontSize: largura * 0.78 * 0.105,
                //   fontWeight: FontWeight.w900,
                // ),
                textAlign: TextAlign.center,
              ),
              // Image(
              //   image: AssetImage(urlImagem),
              //   width: largura * larguraIcon,
              //   height: altura * alturaIcon,
              //   color: Color.fromARGB(255, 255, 222, 89),
              // ),
            ],
          ),
        ),
      ),
    ),
  );
}
