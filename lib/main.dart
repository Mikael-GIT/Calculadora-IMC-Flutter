import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String _text = "Informe seus dados";

  void _resetFields(){
    weightController.text = "";
    heightController.text = "";
    _text = "Informe seus dados";
  }

  void calculate(){
    setState(() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text) / 100;
    double imc = weight / (height * height);
    if(imc < 18.6) {
      _text = "Abaixo do Peso (${imc.toStringAsPrecision(2)})";
    } else if(imc >=18.6 && imc < 24.9){
      _text = "Peso ideal";
    } else if(imc >= 25 && imc < 29.9) {
      _text = "Levemente acima do peso ideal (${imc.toStringAsPrecision(2)})";
    } else if(imc >= 30 && imc < 34.9) {
      _text = "Obesidade Nível I (${imc.toStringAsPrecision(2)})";
    } else if(imc >= 35 && imc < 39.9){
      _text = "Obesidade severa Grau II (${imc.toStringAsPrecision(2)})";
    } else {
      _text = "Obesidade Mórbida Grau III (${imc.toStringAsPrecision(2)})";
    }
    }); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          backgroundColor: Colors.pink,
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields)
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Icon(Icons.person_outlined, size: 120, color: Colors.pink),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Peso em (kg)",
                  labelStyle: TextStyle(color: Colors.pink)),
                  controller: weightController,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.pink, fontSize: 23),
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color: Colors.pink)),
                  controller: heightController,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.pink, fontSize: 23),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.0, bottom: 15.0),
              child: Container(
              height: 50,
              child: ElevatedButton(
              onPressed: calculate,
              style: ElevatedButton.styleFrom(
                primary: Colors.pink,
                onSurface: Colors.black,
                elevation: 10,
                shadowColor: Colors.pink
              ),
              child: Text("Calcular", 
              style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            )
            ),
            ),
            Text(_text, 
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.pink, fontSize: 25))
          ],
        )));
  }
}
