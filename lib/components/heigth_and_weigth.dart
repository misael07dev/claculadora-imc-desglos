import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc_calculador/core/appcolor.dart';

class HeigthAndWeigth extends StatefulWidget {
  final Function(double altura, double peso) onValueChange;
  const HeigthAndWeigth({super.key, required this.onValueChange});

  @override
  State<HeigthAndWeigth> createState() => _HeigthAndWeigthState();
}

class _HeigthAndWeigthState extends State<HeigthAndWeigth> {
  String tipoHeight = "cm";
  String tipoWeight = "kg";

  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITULOS
        Row(
          children: [
            Icon(Icons.height, color: AppColors.primary),
            const SizedBox(width: 5),
            const Text("Altura", style: TextStyle(fontWeight: FontWeight.bold)),

            SizedBox(width: 120.w),

            Icon(Icons.people_sharp, color: AppColors.primary),
            const SizedBox(width: 5),
            const Text("Peso", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),

        /// INPUTS
        Row(
          children: [
            /// ALTURA
            Container(
              height: 35.h,
              width: 155.w,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                    color: Colors.black.withOpacity(0.3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: TextField(
                        controller: heightController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          final altura =
                              double.tryParse(heightController.text) ?? 0;
                          final peso =
                              double.tryParse(weightController.text) ?? 0;
                          widget.onValueChange(altura, peso);
                          double.tryParse(weightController.text) ?? 0;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "0",
                          isCollapsed: true,
                        ),
                      ),
                    ),
                  ),

                  /// LINEA
                  Container(
                    width: 1,
                    height: double.infinity,
                    color: AppColors.border,
                  ),

                  /// SELECTOR
                  GestureDetector(
                    onTap: () => _openSelector(true),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      alignment: Alignment.center,
                      child: Text(tipoHeight),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 20.w),

            /// PESO
            Container(
              height: 35.h,
              width: 155.w,
              decoration: BoxDecoration(
                color: AppColors.background,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: AppColors.border),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 6,
                    offset: const Offset(0, 2),
                    color: const Color(0xFF000000).withOpacity(0.3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: TextField(
                        controller: weightController,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          final altura =
                              double.tryParse(heightController.text) ?? 0;
                          final peso =
                              double.tryParse(weightController.text) ?? 0;
                          widget.onValueChange(altura, peso);
                          double.tryParse(weightController.text) ?? 0;
                        },
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: "0",
                          isCollapsed: true,
                        ),
                      ),
                    ),
                  ),

                  /// LINEA
                  Container(
                    width: 1,
                    height: double.infinity,
                    color: AppColors.border,
                  ),

                  /// SELECTOR
                  GestureDetector(
                    onTap: () => _openSelector(false),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      alignment: Alignment.center,
                      child: Text(tipoWeight),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// SELECTOR MODAL
  void _openSelector(bool isHeight) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        final units = isHeight ? ["cm", "ft"] : ["kg", "lb"];

        return Column(
          mainAxisSize: MainAxisSize.min,
          children: units.map((unit) {
            return ListTile(
              title: Text(unit),
              onTap: () {
                setState(() {
                  if (isHeight) {
                    double altura = double.tryParse(heightController.text) ?? 0;

                    // 🔥 CONVERSIÓN ALTURA
                    if (tipoHeight == "cm" && unit == "ft") {
                      altura = altura / 30.48;
                    } else if (tipoHeight == "ft" && unit == "cm") {
                      altura = altura * 30.48;
                    }

                    heightController.text = altura.toStringAsFixed(2);
                    tipoHeight = unit;
                  } else {
                    double peso = double.tryParse(weightController.text) ?? 0;

                    // 🔥 CONVERSIÓN PESO
                    if (tipoWeight == "kg" && unit == "lb") {
                      peso = peso * 2.20462;
                    } else if (tipoWeight == "lb" && unit == "kg") {
                      peso = peso / 2.20462;
                    }

                    weightController.text = peso.toStringAsFixed(2);
                    tipoWeight = unit;
                  }
                });

                // 🔥 ENVIAR AL PADRE (IMPORTANTE)
                final altura = double.tryParse(heightController.text) ?? 0;
                final peso = double.tryParse(weightController.text) ?? 0;

                widget.onValueChange(altura, peso);

                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
