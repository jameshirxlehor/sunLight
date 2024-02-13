
import 'package:easy_loading_button/easy_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:sunlight/widgets/styledSwitch.dart';
import 'package:sunlight/model/infocidade.dart';



class NovoDimensionamento extends StatefulWidget {
  late List<String> estados;
  late Map<String, List<InfoCidade>> infocidades;
  NovoDimensionamento({super.key, required this.estados, required this.infocidades});
  @override
  State<NovoDimensionamento> createState() => _NovoDimensionamentoState();


}


class _NovoDimensionamentoState extends State<NovoDimensionamento> {


  String textoDropDownEstado = "Selecione";
  String textoDropDownCidade = "Selecione";
  String dropDownMenuOrientacao = "Selecione";


  TextEditingController controllerNomeCliente = TextEditingController();
  TextEditingController controllerEstado = TextEditingController();
  TextEditingController controllerCidade = TextEditingController();
  TextEditingController controllerOrientacaoPlaca = TextEditingController();
  TextEditingController controllerPotenciaPlaca = TextEditingController();
  TextEditingController controllerConsumoMedia = TextEditingController();
  TextEditingController controllerConsumoMesJaneiro = TextEditingController();
  TextEditingController controllerConsumoMesFevereiro = TextEditingController();
  TextEditingController controllerConsumoMesMarco = TextEditingController();
  TextEditingController controllerConsumoMesAbril = TextEditingController();
  TextEditingController controllerConsumoMesMaio = TextEditingController();
  TextEditingController controllerConsumoMesJunho = TextEditingController();
  TextEditingController controllerConsumoMesJulho = TextEditingController();
  TextEditingController controllerConsumoMesAgosto = TextEditingController();
  TextEditingController controllerConsumoMesSetembro = TextEditingController();
  TextEditingController controllerConsumoMesOutubro = TextEditingController();
  TextEditingController controllerConsumoMesNovembro = TextEditingController();
  TextEditingController controllerConsumoMesDezembro = TextEditingController();

  bool mostrarConsumoMesAMes = false;

  _onToggled(bool isToggled) {
    setState(() {
      mostrarConsumoMesAMes = isToggled;
    });
  }

  _getTextTitulo(String tituloText, double fontSize) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Text(
            tituloText,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w700),
          ),
        ),
      ],
    );
  }

  _getDropDownMenuOrientacao(double altura) {
    List<String> items = ["Norte", "Sul", "Leste", "Oeste"];
    return DropdownButton<String>(
      borderRadius: BorderRadius.circular(15),
      alignment: Alignment.center,
      focusColor: Colors.transparent,
      menuMaxHeight: altura*0.55,
      hint: Text(dropDownMenuOrientacao,style: TextStyle(color: Colors.black)),
      dropdownColor: Color.fromARGB(255, 255, 222, 89),
      isExpanded: true,
      style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25,color: Colors.black),
      items: [
        for (var item in items)
          DropdownMenuItem(
            value: item,
            child: Text('${item}'),
          )
      ],
      onChanged: (selected) {
        dropDownMenuOrientacao = selected.toString();
        setState(() {});
      },
    );
  }

  _getDropDownMenuEstado(List<String> items, double altura) {
    return DropdownButton<String>(
      borderRadius: BorderRadius.circular(15),
      alignment: Alignment.center,
      focusColor: Colors.transparent,
      menuMaxHeight: altura*0.55,
      hint: Text(textoDropDownEstado,style: TextStyle(color: Colors.black)),
      dropdownColor: Color.fromARGB(255, 255, 222, 89),
      isExpanded: true,
      style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25,color: Colors.black),
      items: [
        for (var item in items)
          DropdownMenuItem(
            value: item,
            child: Text('${item}'),
          )
      ],
      onChanged: (selected) {
        textoDropDownEstado = selected.toString();
        setState(() {});
      },
    );
  }

  _getDropDownMenuCidades(List<String> items, double altura) {
    return DropdownButton<String>(
      borderRadius: BorderRadius.circular(15),
      alignment: Alignment.center,
      focusColor: Colors.transparent,
      menuMaxHeight: altura*0.55,
      hint: Text(textoDropDownCidade,style: TextStyle(color: Colors.black)),
      dropdownColor: Color.fromARGB(255, 255, 222, 89),
      isExpanded: true,
      style: TextStyle(fontWeight: FontWeight.w800,fontSize: 25,color: Colors.black),
      items: [
        for (var item in items)
          DropdownMenuItem(
            value: item,
            child: Text('${item}'),
          )
      ],
      onChanged: (selected) {
        textoDropDownCidade = selected.toString();
        setState(() {});
      },
    );
  }


  _getCidadesPorEstados(String estado, Map<String, List<InfoCidade>> infocidades){
    List<InfoCidade> listaInfocidades = infocidades[estado]!;

    List<String> cidades = [];
    if(listaInfocidades != null){
      cidades = listaInfocidades.map((e) => e.nome).toList();
      cidades.sort((a,b) => a.compareTo(b));
      return cidades;
    } else{
      return cidades;
    }

  }

  _getTextFormFieldDados(
      String hintText,
      TextEditingController controller,
      String? Function(String?) validator,
      TextInputType textInputType,
      String suffixText) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.black, fontSize: 40),
        suffixText: suffixText,
        //errorText: "Campo Obrigatório",
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(10),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      // Define o comportamento da label quando o campo está focado
      //floatingLabelBehavior: FloatingLabelBehavior.auto,
      keyboardType: textInputType,
    );
  }

  _getSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  _getMedia() {
    return Column(
      children: [
        _getSizedBox(10),
        _getTextTitulo("Média", 20),
        _getTextFormFieldDados("Insira a média de consumo",
            controllerConsumoMedia, (p0) => null, TextInputType.number, "kWh")
      ],
    );
  }

  // _getTextFormFieldDados("Insira o consumo de janeiro", controllerConsumoMesJaneiro, (p0) => null, TextInputType.number);
  _getMesAMes() {
    return Column(
      children: [
        _getTextTitulo("Janeiro", 20),
        _getTextFormFieldDados(
            "Insira o consumo de janeiro",
            controllerConsumoMesJaneiro,
            (p0) => null,
            TextInputType.number,
            "kWh"),
        _getSizedBox(10),
        _getTextTitulo("Fevereiro", 20),
        _getTextFormFieldDados(
            "Insira o consumo de fevereiro",
            controllerConsumoMesFevereiro,
            (p0) => null,
            TextInputType.number,
            "kWh"),
        _getSizedBox(10),
        _getTextTitulo("Março", 20),
        _getTextFormFieldDados(
            "Insira o consumo de março",
            controllerConsumoMesMarco,
            (p0) => null,
            TextInputType.number,
            "kWh"),
        _getSizedBox(10),
        _getTextTitulo("Abril", 20),
        _getTextFormFieldDados(
            "Insira o consumo de abril",
            controllerConsumoMesAbril,
            (p0) => null,
            TextInputType.number,
            "kWh"),
        _getSizedBox(10),
        _getTextTitulo("Maio", 20),
        _getTextFormFieldDados(
            "Insira o consumo de maio",
            controllerConsumoMesMaio,
            (p0) => null,
            TextInputType.number,
            "kWh"),
        _getSizedBox(10),
        _getTextTitulo("Junho", 20),
        _getTextFormFieldDados(
            "Insira o consumo de junho",
            controllerConsumoMesJunho,
            (p0) => null,
            TextInputType.number,
            "kWh"),
        _getSizedBox(10),
        _getTextTitulo("Julho", 20),
        _getTextFormFieldDados(
            "Insira o consumo de julho",
            controllerConsumoMesJulho,
            (p0) => null,
            TextInputType.number,
            "kWh"),
        _getSizedBox(10),
        _getTextTitulo("Agosto", 20),
        _getTextFormFieldDados(
            "Insira o consumo de agosto",
            controllerConsumoMesAgosto,
            (p0) => null,
            TextInputType.number,
            "kWh"),
        _getSizedBox(10),
        _getTextTitulo("Setembro", 20),
        _getTextFormFieldDados(
            "Insira o consumo de setembro",
            controllerConsumoMesSetembro,
            (p0) => null,
            TextInputType.number,
            "kWh"),
        _getSizedBox(10),
        _getTextTitulo("Outubro", 20),
        _getTextFormFieldDados(
            "Insira o consumo de outubro",
            controllerConsumoMesOutubro,
            (p0) => null,
            TextInputType.number,
            "kWh"),
        _getSizedBox(10),
        _getTextTitulo("Novembro", 20),
        _getTextFormFieldDados(
            "Insira o consumo de novembro",
            controllerConsumoMesNovembro,
            (p0) => null,
            TextInputType.number,
            "kWh"),
        _getSizedBox(10),
        _getTextTitulo("Dezembro", 20),
        _getTextFormFieldDados(
            "Insira o consumo de dezembro",
            controllerConsumoMesDezembro,
            (p0) => null,
            TextInputType.number,
            "kWh"),
      ],
    );
  }

  _validatorNome(valor){
    if (valor.isEmpty) {
      return 'Por favor insira o nome';
    }else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    double largura =
        MediaQuery.of(context).size.width; // tamanho da largura da tela
    double altura = MediaQuery.of(context).size.height; // tamanho da altura da
    _getAltura() {
      return altura * 0.02;
    }

    _getLargura() {
      return largura * 0.04;
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 222, 89),
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
      body: Padding(
        padding: EdgeInsets.only(left: _getLargura(), right: _getLargura()),
        child: ListView(
          children: [
            _getSizedBox(_getAltura()),
            _getTextTitulo("Nome Cliente", 30),
            _getTextFormFieldDados(
                "Insira o nome do cliente",
                controllerNomeCliente,
                (p0) => _validatorNome(p0),
                TextInputType.emailAddress,
                ""),
            _getSizedBox(_getAltura()),
            _getTextTitulo("Estado", 30),
            _getDropDownMenuEstado(widget.estados,altura),
            // DropdownButton(items: listaEstados(), onChanged: _click()),
            // _getTextFormFieldDados("Insira o estado", controllerEstado,
            //     (p0) => null, TextInputType.emailAddress, ""),
            _getSizedBox(_getAltura()),
            _getTextTitulo("Cidade", 30),
            _getDropDownMenuCidades(textoDropDownEstado == 'Selecione' ? ['']:_getCidadesPorEstados(textoDropDownEstado, widget.infocidades),altura),
            // _getTextFormFieldDados("Insira a cidade", controllerCidade,
            //     (p0) => null, TextInputType.emailAddress, ""),
            _getSizedBox(_getAltura()),
            _getTextTitulo("Orientação das Placas", 30),
            _getDropDownMenuOrientacao(altura),
            _getSizedBox(_getAltura()),
            _getTextTitulo("Potência da Placa", 30),
            _getTextFormFieldDados(
                "Insira a potência da Placa",
                controllerPotenciaPlaca,
                (p0) => null,
                TextInputType.number,
                "W"),
            _getSizedBox(_getAltura()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getTextTitulo("Consumo De Energia", 30),
              ],
            ),
            _getSizedBox(_getAltura()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _getTextTitulo("Mês a Mês", 25),
                StyledSwitch(onToggled: _onToggled),
                _getTextTitulo("Média", 25),
              ],
            ),
            _getSizedBox(_getAltura()),
            mostrarConsumoMesAMes ? _getMesAMes() : _getMedia(),
            _getSizedBox(_getAltura()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EasyButton(
                  type: EasyButtonType.elevated,
                  // Conteúdo dentro do botão quando o estado do botão está inativo.
                  idleStateWidget: const Text(
                    'Calcular',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  // Conteúdo dentro do botão quando o estado do botão está sendo carregado.
                  loadingStateWidget: const CircularProgressIndicator(
                    strokeWidth: 3.0,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  ),
                  // Animar ou não a largura do botão. O padrão é `true`.
                  // Se estiver definido como `false`, você pode querer definir o parâmetro `useEqualLoadingStateWidgetDimension` como `true`.
                  useWidthAnimation: true,
                  // Se deve ou não forçar o `loadingStateWidget` a ter dimensão igual. O padrão é `true`.
                  // Isso é útil quando você está usando `CircularProgressIndicator` como `loadingStateWidget`.
                  // Este parâmetro também pode ser útil quando você define o parâmetro `useWidthAnimation` como `true` combinado com `CircularProgressIndicator` como o valor para `loadingStateWidget`.
                  useEqualLoadingStateWidgetDimension: false,
                  // Se você quiser um tamanho de largura total, defina como double.infinity
                  width: 150.0,
                  height: 40.0,
                  borderRadius: 4.0,
                  // A elevação do botão.
                  // Isso só será aplicado quando o valor do parâmetro de tipo for EasyButtonType.elevated
                  elevation: 0.0,
                  // A lacuna entre o botão e seu conteúdo.
                  // Isso será ignorado quando o valor do parâmetro `type` for definido como `EasyButtonType.text`
                  contentGap: 6.0,
                  //Cor do botão.
                  // Para [EasyButtonType.elevated]: Esta será a cor de fundo.
                  // Para [EasyButtonType.outlined]: Esta será a cor da borda.
                  // Para [EasyButtonType.text]: Esta será a cor do texto.
                  buttonColor: Colors.black,
                  onPressed: () {},
                ),
              ],
            ),
            _getSizedBox(_getAltura()),
          ],
        ),
      ),
    );
  }
}
