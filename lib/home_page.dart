import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String output = "";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                alignment: Alignment.centerRight,
                child: Text(
                  output,
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const Expanded(
                child: Divider(
              color: Colors.black,
            )),
            Column(
              children: [
                Row(
                  children: [
                    buildButton("AC"),
                    buildButton("+/-"),
                    buildButton("%"),
                    buildButton("/"),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    buildButton("7"),
                    buildButton("8"),
                    buildButton("9"),
                    buildButton("X"),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    buildButton("4"),
                    buildButton("5"),
                    buildButton("6"),
                    buildButton("-"),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    buildButton("1"),
                    buildButton("2"),
                    buildButton("3"),
                    buildButton("+"),
                  ],
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    buildButton("0"),
                    buildButton("."),
                    buildButton("="),
                    // buildButton("/"),
                  ],
                ),
                const SizedBox(height: 10),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 10,
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(15),
          backgroundColor: Colors.black, //  Button color
          foregroundColor: Colors.white, //  Splash color
        ),
        onPressed: () => buttonPressed(buttonText),
        child: Text(
          buttonText,
          style: const TextStyle(
            wordSpacing: 0,
            color: Colors.white,
            fontSize: 25.8,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  buttonPressed(String buttonText) {
    if (buttonText == "AC") {
      _output = "0";
      num1 = 0;
      num2 = 0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "X" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        // print("Already conatains a decimals");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }

    // print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }
}
