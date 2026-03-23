import 'package:flutter/material.dart';
import 'package:imc_calculador/components/prueba.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String sexoSeleccionado = "";

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.wc, color: const Color(0xFF126BB4)),

        Text(
          "Sexo",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        SizedBox(width: 10),

        Prueba(),
      ],
    );
  }
}
