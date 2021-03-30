import 'package:calculadora01/controllers/calculator_contoller.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:auto_size_text/auto_size_text.dart';

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  final _controller = CalculatorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: _buildAppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Divider(color: Colors.white24),
          _builHistory(),
          Divider(color: Colors.white24),
          _buildDisplay(text: _controller.result),
          Divider(color: Colors.white24),
          _buildKeyboard(),
        ],
      ),
    );
  }

//alteração da barra superior
  Widget _buildAppBar() {
    return AppBar(
      title: Text('Calculadora', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.black,
      centerTitle: true,
      actions: <Widget>[
        new IconButton(
          icon: new Icon(Icons.share),
          onPressed: () {
            Share.share(
                'Olhe o código desse aplicativo! https://github.com/vanessa-held/Calculator-Flutter01');
          },
        ),
      ],
      iconTheme: IconThemeData(
        color: Colors.white,
      ),
      textTheme: TextTheme(
          title: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
      )),
    );
  }

  Widget _builHistory() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.bottomRight,
        height: 70,
        child: AutoSizeText(
          _controller.resultCalculate,
          maxLines: 2,
          textAlign: TextAlign.end,
          style: TextStyle(
              fontFamily: 'Calculator', color: Colors.white, fontSize: 50),
        ));
  }

  Widget _buildDisplay({String text}) {
    return Expanded(
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.bottomRight,
          child: Text(
            text ?? '0',
            textAlign: TextAlign.end,
            style: TextStyle(
                fontFamily: 'Calculator', color: Colors.white, fontSize: 60),
          )),
    );
  }

  Widget _buildKeyboard() {
    final height = MediaQuery.of(context).size.height;
    return Container(
      color: Colors.black,
      height: height * 0.65 > 460.0 ? 460 : height * 0.65,
      child: Column(
        children: [
          _buildKeyboardline1(),
          _buildKeyboardline2(),
          _buildKeyboardline3(),
          _buildKeyboardline4(),
          _buildKeyboardline5(),
        ],
      ),
    );
  }

//metodos para a criação de linhas
  Widget _buildKeyboardline1() {
    return Expanded(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      _buidButton(label: 'AC', color: Colors.deepOrange),
      _buidButton(label: 'DEL', color: Colors.deepOrange),
      _buidButton(label: '%', color: Colors.deepOrange),
      _buidButton(label: '/', color: Colors.deepOrange),
    ]));
  }

  Widget _buildKeyboardline2() {
    return Expanded(
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _buidButton(label: '7'),
        _buidButton(label: '8'),
        _buidButton(label: '9'),
        _buidButton(label: 'X', color: Colors.deepOrange),
      ]),
    );
  }

  Widget _buildKeyboardline3() {
    return Expanded(
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _buidButton(label: '4'),
        _buidButton(label: '5'),
        _buidButton(label: '6'),
        _buidButton(label: '-', color: Colors.deepOrange),
      ]),
    );
  }

  Widget _buildKeyboardline4() {
    return Expanded(
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _buidButton(label: '1'),
        _buidButton(label: '2'),
        _buidButton(label: '3'),
        _buidButton(label: '+', color: Colors.deepOrange),
      ]),
    );
  }

  Widget _buildKeyboardline5() {
    return Expanded(
      child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        _buidButton(label: '0', flex: 2),
        _buidButton(label: ','),
        _buidButton(label: '=', color: Colors.deepOrange),
      ]),
    );
  }

//informação de botões
  Widget _buidButton({String label, int flex = 1, color = Colors.white}) {
    return Expanded(
      flex: flex,
      child: RaisedButton(
        child: Text(label,
            style: TextStyle(
              fontSize: 24,
              color: color,
            )),
        color: Colors.black,
        onPressed: () => _calculatorLogic(label),
      ),
    );
  }

  _calculatorLogic(String label) {
    setState(() {
      _controller.applyCommand(label);
    });
  }
}
