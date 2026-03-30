import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum EstadoIMC { sinCalcular, bajoPeso, normal, sobrepeso, obesidad }

class BannerResult extends StatelessWidget {
  final double? imc;

  const BannerResult({super.key, this.imc});

  @override
  Widget build(BuildContext context) {
    final estado = imc == null ? EstadoIMC.sinCalcular : _getEstado(imc!);

    return Container(
      width: 320.w,
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: _getGradient(estado),
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // ICONO
          Container(
            width: 40.w,
            height: 40.w,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                _getIcon(estado),
                color: _getIconColor(estado),
                size: 22.sp,
              ),
            ),
          ),

          SizedBox(width: 10.w),

          // TEXTO
          Expanded(
            child: Text(
              _getTexto(estado),
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 🔥 LÓGICA IMC
  EstadoIMC _getEstado(double imc) {
    if (imc < 18.5) return EstadoIMC.bajoPeso;
    if (imc < 25) return EstadoIMC.normal;
    if (imc < 30) return EstadoIMC.sobrepeso;
    return EstadoIMC.obesidad;
  }

  // 🎨 GRADIENTES
  List<Color> _getGradient(EstadoIMC estado) {
    switch (estado) {
      case EstadoIMC.sinCalcular:
        return [Colors.grey.shade300, Colors.grey.shade100];

      case EstadoIMC.bajoPeso:
        return [const Color(0xFFB3E5FC), const Color(0xFFE1F5FE)];

      case EstadoIMC.normal:
        return [const Color(0xFFC8E6C9), const Color(0xFFE8F5E9)];

      case EstadoIMC.sobrepeso:
        return [const Color(0xFFFFE0B2), const Color(0xFFFFF3E0)];

      case EstadoIMC.obesidad:
        return [const Color(0xFFFFCDD2), const Color(0xFFFFEBEE)];
    }
  }

  // 🎯 ICONOS
  IconData _getIcon(EstadoIMC estado) {
    switch (estado) {
      case EstadoIMC.sinCalcular:
        return Icons.info_outline;

      case EstadoIMC.bajoPeso:
        return Icons.warning_amber_rounded;

      case EstadoIMC.normal:
        return Icons.check_circle;

      case EstadoIMC.sobrepeso:
        return Icons.warning_amber_rounded;

      case EstadoIMC.obesidad:
        return Icons.error;
    }
  }

  // 🎨 COLOR ICONO
  Color _getIconColor(EstadoIMC estado) {
    switch (estado) {
      case EstadoIMC.sinCalcular:
        return Colors.grey;

      case EstadoIMC.bajoPeso:
        return Colors.blue;

      case EstadoIMC.normal:
        return Colors.green;

      case EstadoIMC.sobrepeso:
        return Colors.orange;

      case EstadoIMC.obesidad:
        return Colors.red;
    }
  }

  // 📝 TEXTO
  String _getTexto(EstadoIMC estado) {
    switch (estado) {
      case EstadoIMC.sinCalcular:
        return "Ingresa tus datos para calcular tu IMC.";

      case EstadoIMC.bajoPeso:
        return "¡Atención! Estás por debajo del peso recomendado.";

      case EstadoIMC.normal:
        return "¡Excelente! Tu peso está en el rango normal.";

      case EstadoIMC.sobrepeso:
        return "¡Atención! Estás en rango de sobrepeso.";

      case EstadoIMC.obesidad:
        return "¡Cuidado! Estás en rango de obesidad.";
    }
  }
}
