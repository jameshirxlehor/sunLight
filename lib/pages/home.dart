import 'package:flutter/material.dart';
import '../widgets/cardOpcaoHome.dart';
import 'package:card_swiper/card_swiper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double largura =
        MediaQuery.of(context).size.width; // tamanho da largura da tela
    double altura =
        MediaQuery.of(context).size.height; // tamanho da altura da tela

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 51, 31),
      appBar: AppBar(
        title: const Text(
          'SunLight',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0),
              fontWeight: FontWeight.w400,
              fontSize: 30),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 222, 89),
      ),
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          if (index == 1) {
            return cardOpcaoHome(
              largura: largura,
              altura: altura,
              palavraPrimaria: "Dimensionamentos",
              palavraSecundaria: "Realizados",
              urlImagem: "assets/image/page2.png",
              click: () {},
            );
          }
          if (index == 2) {
            return cardOpcaoHome(
              largura: largura,
              altura: altura,
              palavraPrimaria: "Dúvidas sobre",
              palavraSecundaria: "Dimensionamentos",
              urlImagem: "assets/image/page3.png",
              click: () {},
            );
          } else {
            return cardOpcaoHome(
              largura: largura,
              altura: altura,
              palavraPrimaria: "Novo",
              palavraSecundaria: "Dimensionamento",
              urlImagem: "assets/image/page1.png",
              click: () {},
            );
          }
        },
        itemCount: 3,
        pagination: SwiperPagination(builder: SwiperPagination.rect),
        control: SwiperControl(color: Color.fromARGB(255, 255, 222, 89)),
        loop: false,

      ),
    );
  }
}
