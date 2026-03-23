import 'package:flutter/material.dart';

class ImcText extends StatefulWidget {
  final Color color;
  final double tituloFontSize;

  const ImcText({
    super.key,
    this.color = Colors.black,
    this.tituloFontSize = 25,
  });

  @override
  State<ImcText> createState() => _ImcTextState();
}

class _ImcTextState extends State<ImcText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      "IMC",
      style: TextStyle(
        fontSize: widget.tituloFontSize,
        fontWeight: FontWeight.bold,
        color: widget.color,
      ),
    );
  }
}
