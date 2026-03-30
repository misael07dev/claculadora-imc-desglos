import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc_calculador/components/ageslider.dart';
import 'package:imc_calculador/components/calcular.dart';
import 'package:imc_calculador/components/cardresultado.dart';
import 'package:imc_calculador/components/gender_selector.dart';
import 'package:imc_calculador/components/heigth_and_weigth.dart';
import 'package:imc_calculador/core/app_text.dart';
import 'package:imc_calculador/components/banner_ad_widget.dart.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double edad = 23;
  bool isMale = true;
  double altura = 0;
  double peso = 0;
  double? imc;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 20.h),

          // 🧠 Título
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Calcula tu ",
                style: TextStyle(
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                ),
              ),
              ImcText(color: const Color(0xFF126BB4), tituloFontSize: 35),
            ],
          ),

          SizedBox(height: 4.h),

          Text(
            "Índice de Masa Corporal",
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
              height: 1.2,
            ),
          ),

          // 👤 Género
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: GenderSelector(
              isGenderSelected: isMale,
              onGenderChange: (gender) {
                setState(() {
                  isMale = gender;
                });
              },
            ),
          ),

          // 📏 Altura y peso
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: HeigthAndWeigth(
              onValueChange: (h, w) {
                setState(() {
                  altura = h;
                  peso = w;
                });
              },
            ),
          ),

          // 🎂 Edad
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: AgeSlider(
              edad: edad,
              onAgeChange: (valoredad) {
                setState(() {
                  edad = valoredad;
                });
              },
            ),
          ),

          SizedBox(height: 5.h),

          // 🔘 Botón calcular
          Calcular(
            onTap: () {
              double alturaMetros = altura / 100;

              if (alturaMetros > 0 && peso > 0) {
                setState(() {
                  imc = peso / (alturaMetros * alturaMetros);
                });
              }
            },
          ),

          SizedBox(height: 5.h),

          // 📊 Resultado
          Cardresultado(imc: imc),

          SizedBox(height: 15.h),

          // 📢 Banner
          const BannerAdWidget(),

          SizedBox(height: 20.h), // 👈 extra para que no quede pegado al borde
        ],
      ),
    );
  }
}
