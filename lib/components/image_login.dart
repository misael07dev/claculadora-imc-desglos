import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageLogin extends StatefulWidget {
  const ImageLogin({super.key});

  @override
  State<ImageLogin> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ImageLogin> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: SvgPicture.asset("assets/image/fondo2.svg", width: 600),
    );
  }
}
