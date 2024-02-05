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
    double largura = MediaQuery.of(context).size.width; // tamanho da largura da tela
    double altura = MediaQuery.of(context).size.height; // tamanho da altura da tela
    return Scaffold(
      backgroundColor: const Color.fromARGB(
        255,
        0,
        0,
        0,
      ),
      appBar: AppBar(
        title: const Text(
          'SunLight',
          style: TextStyle(
              color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w400,fontSize: 30),
        ),
        backgroundColor: const Color.fromARGB(255, 255, 222, 89),
      ),
      body: Swiper(
        itemBuilder: (BuildContext context,int index){
          return cardOpcaoHome(largura,altura);
        },
        itemCount: 3,
        pagination: SwiperPagination(),
        control: SwiperControl(color: Color.fromARGB(255, 255, 222, 89)),

      ),
    );
  }
}
