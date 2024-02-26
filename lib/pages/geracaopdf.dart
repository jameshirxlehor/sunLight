import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import '../model/dimensionamentorealizado.dart';


class GeracaoPdf extends StatefulWidget {
  DimensionamentoRealizado dimensionamentoRealizadoEnviadoDeOutraTela;

  GeracaoPdf(
      {super.key, required this.dimensionamentoRealizadoEnviadoDeOutraTela});

  @override
  State<GeracaoPdf> createState() => _GeracaoPdfState();
}

class _GeracaoPdfState extends State<GeracaoPdf> {
  final String titleAppBar = 'Registro de dimensionamento';
  final String title = 'Flutter';

  _resultadoMedia() {
    late double producao =
        widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoJan +
            widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoFev +
            widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoMar +
            widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoAbr +
            widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoMai +
            widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoJun +
            widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoJul +
            widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoAgo +
            widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoSete +
            widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoOutu +
            widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoNov +
            widget.dimensionamentoRealizadoEnviadoDeOutraTela.producaoDez;
    return (producao / 12);
  }

  resultado(double? resultado) {
    if (resultado != null) {
      return resultado.toStringAsFixed(2);
    }
  }

  _getRowMedia() {
    return pw.Padding(
      padding: pw.EdgeInsets.only(bottom: 8.0),
      child: pw.Expanded(
        child: pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: [
            pw.Text('Média:',
                style: pw.TextStyle(
                  font: pw.Font.timesBold(),
                  fontSize: 18,
                  color: PdfColors.yellow,
                  // color: PdfColor.fromHex('#263238'),
                )
              //style: GoogleFonts.robotoMono(fontWeight: FontWeight.bold, fontSize: 17, color: Colors.white70),
            ),
            pw.SizedBox(
              width: 12,
            ),
            pw.Text('${_resultadoMedia().toStringAsFixed(2)}kWh',
                style: pw.TextStyle(
                  font: pw.Font.timesBold(),
                  fontSize: 18,
                  color: PdfColors.yellow,
                  // color: PdfColor.fromHex('#263238'),
                )
              // style: GoogleFonts.robotoMono(
              //     color: Colors.green,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }

  _getRowCadaMes(String mes,
      double? consumoMensal,
      double altura,
      double largura,) {
    return pw.Expanded(
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text("$mes:",
                  textAlign: pw.TextAlign.center,
                  style: pw.TextStyle(
                    font: pw.Font.timesBold(),
                    fontSize: 18,
                    color: PdfColors.white,
                    // color: PdfColor.fromHex('#263238'),

                  )
                // style: PdfGoogleFonts.robotoMono(color: Colors.grey[600], fontSize: 17, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          pw.SizedBox(
            width: 20,
          ),
          pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              pw.Text(
                textAlign: pw.TextAlign.center,
                '${resultado(consumoMensal)} kWh',
                style: pw.TextStyle(
                  font: pw.Font.timesBold(),
                  fontSize: 18,
                  color: PdfColor.fromHex('#fede59'),
                  // color: PdfColor.fromHex('#263238'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _cardGeracaoMesMedia(double altura, double largura, DimensionamentoRealizado dimensionamento) {
    return pw.Center(
      child: pw.Opacity(
        opacity: 0.68,
        child: pw.Container(
          width: 320,
          height: 400,
          decoration: pw.BoxDecoration(
            color: PdfColor.fromHex('#263238'),
            border: pw.Border.all(width: 1, color: PdfColor.fromHex('#fede59')),
            borderRadius: pw.BorderRadius.circular(20),
          ),
          child: pw.Column(
            children: [
              pw.SizedBox(height: 2),
              pw.Text("Geração de Energia Mensal",
                  style: pw.TextStyle(
                      font: pw.Font.timesBold(),
                      fontSize: 22,
                      color: PdfColor.fromHex('#fede59'),)
                      // color: PdfColor.fromHex('#263238'),)
                // style: PdfGoogleFonts.robotoMono(color: Colors.grey[600], fontSize: 17, fontWeight: FontWeight.w400),
              ),
              _getRowCadaMes(
                  "Janeiro", dimensionamento.producaoJan, altura, largura),
              _getRowCadaMes(
                  "Feveiro", dimensionamento.producaoFev, altura, largura),
              _getRowCadaMes(
                  "Março", dimensionamento.producaoMar, altura, largura),
              _getRowCadaMes(
                  "Abril", dimensionamento.producaoAbr, altura, largura),
              _getRowCadaMes(
                  "Maio", dimensionamento.producaoMai, altura, largura),
              _getRowCadaMes(
                  "Junho", dimensionamento.producaoJun, altura, largura),
              _getRowCadaMes(
                  "Julho", dimensionamento.producaoJul, altura, largura),
              _getRowCadaMes(
                  "Agosto", dimensionamento.producaoAgo, altura, largura),
              _getRowCadaMes(
                  "Setembro", dimensionamento.producaoSete, altura, largura),
              _getRowCadaMes(
                  "Outubro", dimensionamento.producaoOutu, altura, largura),
              _getRowCadaMes(
                  "Novembro", dimensionamento.producaoNov, altura, largura),
              _getRowCadaMes("Dezembro", dimensionamento.producaoDez, altura,largura),
              _getRowMedia(),
            ],
          ),
        ),
      ),
    );
  }


  _getDadosContainer(String text, image) {
    return pw.Container(
      width: 320,
      height: 50,
      decoration: pw.BoxDecoration(
        border: pw.Border.all(width: 1, color: PdfColor.fromHex('#fede59'),),
        borderRadius: pw.BorderRadius.circular(20),
        color: PdfColor.fromHex('#263238'),
      ),
      child: pw.Row(
        mainAxisAlignment: pw.MainAxisAlignment.center,
        children: [
          pw.Image(image, height: 40, width: 50),
          pw.SizedBox(width: 6),
          pw.Text(text,
            style: pw.TextStyle(
              font: pw.Font.timesBold(),
              fontSize: 20,
              color: PdfColors.white,),),
        ],
      ),
    );
  }


  _getCaixaResultados(double sugestaoModulos, double potenciakit, double area,
      image1, image2, image3) {
    return pw.Opacity(
      opacity: 0.68,
      child: pw.Padding(
        padding: const pw.EdgeInsets.all(22.0),
        child: pw.SizedBox(
          child: pw.Column(
            mainAxisAlignment: pw.MainAxisAlignment.center,
            children: [
              _getDadosContainer(
                  "Sugestão de placas: ${sugestaoModulos.ceil().toStringAsFixed(
                      0)}", image1),
              pw.SizedBox(height: 10),
              _getDadosContainer(
                  "Potência do KIT: ${potenciakit.toStringAsFixed(2)}kWp",
                  image2),
              pw.SizedBox(height: 10),
              _getDadosContainer(
                  "Área ocupada: ${area.toStringAsFixed(1)} m²", image3),

            ],
          ),
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    double largura =
        MediaQuery.of(context).size.width; // tamanho da largura da tela
    double altura =
        MediaQuery.of(context).size.height; // tamanho da altura da tela
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.blueGrey[900],
      theme: ThemeData(
          primaryColor: Colors.blueGrey[900],
          appBarTheme: AppBarTheme(backgroundColor: Colors.blueGrey[900])),
      home: Scaffold(
        appBar: AppBar(
          leading:
            IconButton(onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back,color: Color.fromARGB(255, 255, 222, 89),),
            ),
          automaticallyImplyLeading: true,
            title: Row(
              children: [
                Image.asset(
                  'assets/image/Sunlight_logo.png',
                  height: altura * 0.04,
                ),
                SizedBox(width: largura * 0.04,),
                Text(
                  'Registro Dimensionamento',
                  style: GoogleFonts.lobster(
                      fontSize: largura * 0.85 * 0.07,
                      color: const Color.fromARGB(255, 255, 222, 89),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
        ),
        body: PdfPreview(
          canChangeOrientation: false,
          canChangePageFormat: false,
          pdfFileName: widget.dimensionamentoRealizadoEnviadoDeOutraTela.nome,
          canDebug: false,
          allowSharing: false,
          pdfPreviewPageDecoration: const BoxDecoration(
              color: Colors.transparent
          ),
          build: (format) => _generatePdf(format, title),
        ),
      ),
    );
  }

  Future<Uint8List> _generatePdf(PdfPageFormat format, String title) async {
    final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: false);
    double largura = MediaQuery.of(context)
        .size
        .width;
    double altura = MediaQuery
        .of(context)
        .size
        .height;
    final image1 = await imageFromAssetBundle('assets/image/page1.png');
    final image2 = await imageFromAssetBundle('assets/image/potencia.png');
    final image3 = await imageFromAssetBundle('assets/image/area.png');
    final imageJpg = (await rootBundle.load('assets/image/pdfSunlight.png'))
        .buffer.asUint8List();
    final pageTheme = pw.PageTheme(
      pageFormat: PdfPageFormat.a4,
      buildBackground: (Context){
        return pw.FullPage(
              ignoreMargins: true,
              child: pw.Image(pw.MemoryImage(imageJpg),
              ),
          );
    },
    );


    pdf.addPage(
      pw.Page(
        pageTheme: pageTheme,
        build: (context) {
          return pw.Expanded(
                child: pw.Column(
                  mainAxisAlignment: pw.MainAxisAlignment.center,
                  children: [
                    pw.SizedBox(height: 20),
                    _cardGeracaoMesMedia(altura, largura,widget.dimensionamentoRealizadoEnviadoDeOutraTela),
                    _getCaixaResultados(
                        widget.dimensionamentoRealizadoEnviadoDeOutraTela.sugestaoPlacas,
                        widget.dimensionamentoRealizadoEnviadoDeOutraTela.potenciakit,
                        widget.dimensionamentoRealizadoEnviadoDeOutraTela.areOcupada,
                        image1,
                        image2,
                        image3,
                    ),
                  ],
                ),

              );
        },
      ),
    );

    return pdf.save();
  }
}
