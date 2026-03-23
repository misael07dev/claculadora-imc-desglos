import 'package:flutter/material.dart';
import 'package:imc_calculador/components/heigth.dart';
import 'package:imc_calculador/components/weigth.dart';

class HeigthAndWeigth extends StatefulWidget {
  const HeigthAndWeigth({super.key});

  @override
  State<HeigthAndWeigth> createState() => _HeigthAndWeigthState();
}

class _HeigthAndWeigthState extends State<HeigthAndWeigth> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// TITULOS
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox(width: 25),
            Icon(Icons.height, color: const Color(0xFF126BB4)),
            Text("Altura", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(width: 135),
            Icon(Icons.people_sharp, color: const Color(0xFF126BB4)),
            Text("Peso", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),

        const SizedBox(height: 01),

        /// INPUTS
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 30),
            Heigth(),
            SizedBox(width: 30),
            weigth(),
          ],
        ),
      ],
    );
  }
}
