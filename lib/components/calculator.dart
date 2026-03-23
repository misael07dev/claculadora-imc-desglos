import 'package:flutter/material.dart';
import 'package:imc_calculador/components/ageslider.dart';
import 'package:imc_calculador/components/gender_selector.dart';
import 'package:imc_calculador/components/heigth_and_weigth.dart';
import 'package:imc_calculador/core/app_text.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min, // evita que se estire
      children: [
        SizedBox(height: 11),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Calcula tu ",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                height: 0,
              ),
            ),
            ImcText(color: const Color(0xFF126BB4)),
          ],
        ),

        SizedBox(height: 0), // controla separación

        Text(
          "Índice de Masa Corporal",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            height: 0,
          ),
        ),
        SizedBox(height: 10),
        GenderSelector(), //  aquí llamas la clase
        SizedBox(height: 15),
        HeigthAndWeigth(),
        SizedBox(height: 15),
        AgeSlider(),
        SizedBox(height: 15),
      ],
    );
  }
}
