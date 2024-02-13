import 'package:flutter/material.dart';
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
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Image
              Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 222, 89),
                    image: DecorationImage(image: imageUrl, fit: BoxFit.cover),
                    borderRadius: const BorderRadius.all(Radius.circular(75.0)),
                    boxShadow: const [
                      BoxShadow(blurRadius: 7.0, color: Colors.grey)
                    ]),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: altura,
                    ),
                    Container(
                      height: 30,
                      child: TextButton(
                        onPressed: () {
                          _launchUrl(Uri.parse(url1));
                        },
                        child: Text(
                          url1,
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Container(
                      height: 30,
                      child: TextButton(
                        onPressed: () {
                          _launchUrl(Uri.parse(url2));
                        },
                        child: Text(
                          url2,
                          style: const TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w600),
                        ),
                      ),
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
      return altura * 0.005;
    }

    double largura =
        MediaQuery.of(context).size.width; // tamanho da largura da tela

    getLargura() {
      return largura * 0.03;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Novo Dimensionamento',
          style: TextStyle(
              color: Color.fromARGB(255, 255, 222, 89),
              fontWeight: FontWeight.w600,
              fontSize: 25),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Color.fromARGB(255, 255, 222, 89),
      body: ListView(
        children: [
          SizedBox(height: getAltura()),
          buildCard(
            "James Hirxlehor",
            AssetImage('assets/image/Me.james.png'),
            "linkedin.com/in/jameshirxlehor",
            'https://example.com/url2',
            getLargura(),
              getSepararText(),
          ),
          SizedBox(
            height: getEspacamento(),
          ),
          buildCard(
            "João Lazzarotto",
            AssetImage('assets/image/joaolazzarotto.png'),
            "linkedin.com/in/joaolazzarotto",
            "github.com/JoaoLazzarotto",
            getLargura(),
              getSepararText(),
          ),
          SizedBox(
            height: getEspacamento(),
          ),
          buildCard(
            "Peterson Filipe",
            AssetImage("assets/image/peterson.jpg"),
            "linkedin.com/in/petersonsidral",
            'https://example.com/url4',
            getLargura(),
              getSepararText(),
          ),
          SizedBox(
            height: getEspacamento(),
          ),
          buildCard(
            "Rafael Klug",
            AssetImage('assets/image/rafaelqualy.png'),
            "linkedin.com/in/rafaelleonardoklug",
            'https://example.com/url4',
            getLargura(),
              getSepararText(),
          ),
          SizedBox(
            height: getEspacamento(),
          ),
          buildCard(
            "Rafael Ramos",
            AssetImage('assets/image/rafaelramos.png'),
            "linkedin.com/in/rafael-ros",
            'https://example.com/url4',
            getLargura(),
              getSepararText(),
          ),
        ],
      ),
    );
  }
}
