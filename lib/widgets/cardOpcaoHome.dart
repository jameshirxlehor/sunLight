import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// DecorationImage(image: AssetImage(urlImagem), fit: BoxFit.cover)
cardOpcaoHome(
    {required double largura,
    required double altura,
    required String palavraPrimaria,
    double larguraIcon = 0.75,
    double alturaIcon = 0.4,
    required click(),
    required DecorationImage image}) {
  return Center(
    child: GestureDetector(
      onTap: click,
      child: Card(
        borderOnForeground: true,
        elevation: 30,
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), //<-- SEE HERE
        ),
        color: const Color.fromARGB(100, 255, 255, 255),
        child: SizedBox(
          width: largura * 0.89,
          height: altura * 0.61,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 6,
                  child: Container(
                    decoration: BoxDecoration(
                        image: image, borderRadius: const  BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25))),
                  ),
                ),
                SizedBox(
                  height: altura * 0.01,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
                        color: Colors.white),
                    child: Center(
                      child: Text(
                        palavraPrimaria,
                        style: GoogleFonts.inter(
                            fontSize: largura * 0.85 * 0.11,
                            color: const Color.fromARGB(235, 38, 50, 56),
                        fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
