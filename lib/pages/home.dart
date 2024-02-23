import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sunlight/dao/impl/dimensionamento_dao_db.dart';
import 'package:sunlight/dao/impl/infocidade_dao_mem.dart';
import 'package:sunlight/domain/mediator.dart';
import 'package:sunlight/pages/novoDimensionamento.dart';
import 'package:sunlight/pages/sobreDesenvolvedores.dart';
import '../dao/dimensionamentodao.dart';
import '../database/localdatabase.dart';
import '../widgets/cardOpcaoHome.dart';
import 'package:card_swiper/card_swiper.dart';
import 'dimensionamentosRealizados.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late DimensionamentoDao _dimensionamentoDao;

  TextEditingController controllerTexto = TextEditingController();
  late LocalDatabase localDatabase;
  List<String> listaEstado = [];
  var infoCidade;

  @override
  initState() {
    localDatabase = LocalDatabase();
    localDatabase.initDatabase("app.db").then((db) async {
      var mediator = Mediator();
      mediator.db = db;
      _dimensionamentoDao = DimensionamentoDaoDb(db: db);

      mediator.mapaCidades = await InfoCidadeDaoMem().listarCidades();

      listaEstado = mediator.mapaCidades.keys.toList();
      print(mediator.mapaCidades.keys);
      infoCidade = mediator.mapaCidades;
    });
  }

  @override
  Widget build(BuildContext context) {
    double largura =
        MediaQuery.of(context).size.width; // tamanho da largura da tela
    double altura =
        MediaQuery.of(context).size.height; // tamanho da altura da tela

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'SunLight',
          style: GoogleFonts.lobster(
              fontSize: largura * 0.85 * 0.11,
              color: Colors.black,
              fontWeight: FontWeight.w500),
        ),
        backgroundColor: Color.fromARGB(255, 255, 222, 89),
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/image/paisagem.png'),
                fit: BoxFit.cover)),
        child: PageView(
            children: [
          cardOpcaoHome(
            largura: largura,
            altura: altura,
            palavraPrimaria: "Novo",
            palavraSecundaria: "Dimensionamento",
            image: const DecorationImage(
                image: AssetImage("assets/image/dimensionar.jpg"),
                fit: BoxFit.cover),
            click: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NovoDimensionamento(
                          estados: listaEstado, infocidades: infoCidade,editarOuNao: false,)));
            },
          ),
          cardOpcaoHome(
            largura: largura,
            altura: altura,
            palavraPrimaria: "Dimensionamentos",
            palavraSecundaria: "Realizados",
            image: const DecorationImage(
                image: AssetImage("assets/image/realizados.jpg"),
                fit: BoxFit.cover),
            click: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DimensionamentosRealizados(
                      )));
            },
          ),
          cardOpcaoHome(
            largura: largura,
            altura: altura,
            palavraPrimaria: "Sobre os",
            palavraSecundaria: "Desenvolvedores",
            image: const DecorationImage(
                image: AssetImage("assets/image/equipe.jpg"), fit: BoxFit.cover),
            click: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SobreDesenvolvedores()));
            },
          ),
        ]),
      ),
    );
  }
}
