import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageLogin extends StatefulWidget {
  final double? width; // ancho opcional
  final double? height; // alto opcional

  const ImageLogin({super.key, this.width, this.height});

  @override
  State<ImageLogin> createState() => _ImageLoginState();
}

class _ImageLoginState extends State<ImageLogin> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width ?? 1.sw, // si no pasa ancho, usa ancho completo
      height: widget.height ?? 0.5.sh, // si no pasa alto, usa 30% de pantalla
      child: SvgPicture.asset("assets/image/fondo2.svg", fit: BoxFit.contain),
    );
  }
}
