import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nota1Controller = TextEditingController();
  TextEditingController nota2Controller = TextEditingController();
  TextEditingController nota3Controller = TextEditingController();
  TextEditingController nota4Controller = TextEditingController();

  String _infoText = "Informe suas notas";

  void _resetFields() {
    nota1Controller.clear();
    nota2Controller.clear();
    nota3Controller.clear();
    nota4Controller.clear();

    setState(() {
      _infoText = "Informe suas notas";
    });
  }

  void _calcular() {
    double? nota1 = double.tryParse(nota1Controller.text);
    double? nota2 = double.tryParse(nota2Controller.text);
    double? nota3 = double.tryParse(nota3Controller.text);
    double? nota4 = double.tryParse(nota4Controller.text);

    if (nota1 == null || nota2 == null || nota3 == null || nota4 == null) {
      setState(() {
        _infoText = "Preencha todas as notas corretamente!";
      });
      return;
    }

    setState(() {
      double media = (nota1 + nota2 + nota3 + nota4) / 4;

      if (media == 5) {
        _infoText = "Você ficou com R. Precisa estudar muito!";
      } else if (media >= 6 && media <= 8) {
        _infoText = "Você ficou com B. Precisa estudar um pouco mais!";
      } else if (media >= 9 && media <= 10) {
        _infoText = "Você ficou com MB. Foi aprovado com excelência!";
      } else {
        _infoText =
            "Média: ${media.toStringAsFixed(2)}. Resultado não classificado.";
      }

      print("Média: $media");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora de Média"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 5, 136, 243),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: _resetFields),
        ],
      ),

      backgroundColor: const Color.fromARGB(255, 175, 209, 236),

      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Nota 1",
                labelStyle: TextStyle(color: Colors.blue),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 25.0),
              controller: nota1Controller,
            ),

            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Nota 2",
                labelStyle: TextStyle(color: Colors.blue),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 25.0),
              controller: nota2Controller,
            ),

            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Nota 3",
                labelStyle: TextStyle(color: Colors.blue),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 25.0),
              controller: nota3Controller,
            ),

            TextField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Nota 4",
                labelStyle: TextStyle(color: Colors.blue),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 25.0),
              controller: nota4Controller,
            ),

            Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: SizedBox(
                height: 40.0,
                child: ElevatedButton(
                  onPressed: _calcular,
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 25.0),
                  ),
                ),
              ),
            ),

            Text(
              _infoText,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue, fontSize: 22.0),
            ),
          ],
        ),
      ),
    );
  }
}
