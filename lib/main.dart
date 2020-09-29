import 'package:flutter/material.dart';

void main() {
  //No home: Home() -> chamamos nosso widget
  runApp(MaterialApp(title: "Contador", home: Home()));
}

//Stateful é um widget que tem seu estado alterado
//StateLess é um widget que não tem seu estado alterado
class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _pessoas = 0;

  //O anderlaine serve para privar a variável
  String _infoText = "Pode Entrar";

  //Método para atualizar só a parte do código que estamo usando no widget
  void _mudarTexto(int numero) {
    setState(() {
      _pessoas += numero;

      if (_pessoas < 0) {
        _infoText = "Mundo invertido!";
      } else if (_pessoas <= 10) {
        _infoText = "Pode entrar";
      } else {
        _infoText = "Lotado";
      }
    });
  }

//Método de contrução do widget
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/fundo.jpg",
          fit: BoxFit.fill,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              //o $ serve para adicionar a variável ao texto e mostrar seu valor!
              "Pessoas: $_pessoas",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(20),
                  child: FlatButton(
                    child: Text(
                      "+1",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    onPressed: () {
                      //Método de incremento e decremento
                      _mudarTexto(1);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: FlatButton(
                    child: Text(
                      "-1",
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    onPressed: () {
                      //Método de incremento e decremento
                      _mudarTexto(-1);
                    },
                  ),
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(color: Colors.white, fontSize: 30),
            )
          ],
        ),
      ],
    );
  }
}
