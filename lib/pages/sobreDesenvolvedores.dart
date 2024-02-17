import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SobreDesenvolvedores extends StatelessWidget {
  SobreDesenvolvedores({super.key});

  Future _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  buildCard(String name, ImageProvider imageUrl, String url1, String url2,
      double espacamento, double altura) {
    return Padding(
      padding: EdgeInsets.only(left: espacamento, right: espacamento),
      child: Container(
        decoration: BoxDecoration(
          color:  const Color.fromRGBO(0, 0, 0, 99),
          borderRadius: BorderRadius.circular(75),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16,right: 16,top: 8,bottom: 8),
          child: Row(
            children: [
              Container(
                width: 90.0,
                height: 90.0,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 222, 89),
                    image: DecorationImage(image: imageUrl, fit: BoxFit.cover),
                    borderRadius: const BorderRadius.all(Radius.circular(75.0)),
                    boxShadow: const [
                      BoxShadow(blurRadius: 7.0, color: Colors.grey)
                    ]),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color:  Color.fromARGB(255, 255, 222, 89),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: IconButton(
                            onPressed: () {
                              _launchUrl(Uri.parse(url1));
                            },
                            icon: const Icon(
                              Bootstrap.linkedin,
                              color: Colors.white70
                              ,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              _launchUrl(Uri.parse(url1));
                            },
                            child: const Text(
                              "LinkedIn",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40,
                          height: 40,
                          child: IconButton(
                            onPressed: () {
                              _launchUrl(Uri.parse(url2));
                            },
                            icon: const Icon(
                              Bootstrap.github,
                              color: Colors.white70
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                          child: TextButton(
                            onPressed: () {
                              _launchUrl(Uri.parse(url2));
                            },
                            child: const Text(
                              "GitHub",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.w600,fontSize: 17),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    double altura =
        MediaQuery.of(context).size.height; // tamanho da altura da tela

    getAltura() {
      return altura * 0.03;
    }

    getSepararText() {
      return altura * 0.004;
    }

    getEspacamento() {
      return altura * 0.02;
    }

    double largura =
        MediaQuery.of(context).size.width; // tamanho da largura da tela

    getLargura() {
      return largura * 0.03;
    }

    // decoration: const BoxDecoration(
    //     image: DecorationImage(
    //         image: AssetImage('assets/image/paisagem.png'),
    //         fit: BoxFit.cover)),

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sobre os Desenvolvedores',
          style: GoogleFonts.lobster(
              fontSize: largura * 0.85 * 0.09,
              color: const Color.fromARGB(255, 255, 222, 89),
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        decoration: const BoxDecoration(image: DecorationImage(image: AssetImage('assets/image/paisagem.png'), fit: BoxFit.cover)),
        child: ListView(
          children: [
            SizedBox(
              height: getAltura(),
            ),
            buildCard(
              "James Hirxlehor",
              const AssetImage('assets/image/Me.james.png'),
              "https://www.linkedin.com/in/jameshirxlehor/",
              "https://github.com/jameshirxlehor",
              getLargura(),
              getSepararText(),
            ),
            SizedBox(
              height: getEspacamento(),
            ),
            buildCard(
              "João Lazzarotto",
              const AssetImage('assets/image/joaolazzarotto.png'),
              "https://www.linkedin.com/in/joaolazzarotto/",
              "https://github.com/JoaoLazzarotto",
              getLargura(),
              getSepararText(),
            ),
            SizedBox(
              height: getEspacamento(),
            ),
            buildCard(
              "Peterson Filipe",
              const AssetImage("assets/image/peterson.jpeg"),
              "https://www.linkedin.com/in/petersonsidral/",
              "https://github.com/petysid",
              getLargura(),
              getSepararText(),
            ),
            SizedBox(
              height: getEspacamento(),
            ),
            buildCard(
              "Rafael Klug",
              const AssetImage('assets/image/rafaelqualy.png'),
              "https://www.linkedin.com/in/rafaelklug/",
              "https://github.com/rafellklug",
              getLargura(),
              getSepararText(),
            ),
            SizedBox(
              height: getEspacamento(),
            ),
            buildCard(
              "Rafael Ramos",
              const AssetImage('assets/image/rafaelramos.png'),
              "https://www.linkedin.com/in/rafael-ros/",
              "https://github.com/Rafelrosod",
              getLargura(),
              getSepararText(),
            ),
          ],
        ),
      ),
    );
  }
}
