import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return SizedBox(
      height: 0.9.sh, // altura de la card
      width: 1.sw,
      child: Stack(
        children: [
          // 📌 Textos centrados
          Column(
            children: [
              SizedBox(height: 20.h),
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
                  ImcText(color: const Color(0xFF126BB4)),
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

              // 📌 Controles posicionados libremente
              GenderSelector(),

              HeigthAndWeigth(),

              AgeSlider(),
            ],
          ),
        ],
      ),
    );
  }
}
