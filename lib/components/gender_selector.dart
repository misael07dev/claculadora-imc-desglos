import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc_calculador/core/appcolor.dart';

class GenderSelector extends StatefulWidget {
  final bool isGenderSelected;
  final Function(bool) onGenderChange;
  const GenderSelector({
    super.key,
    required this.isGenderSelected,
    required this.onGenderChange,
  });

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(Icons.wc, color: AppColors.primary),

        Text(
          "Sexo",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),

        SizedBox(width: 10),
        Center(
          child: GestureDetector(
            onTap: () {
              widget.onGenderChange(!widget.isGenderSelected);
            },
            child: Container(
              width: 265.w,
              height: 40.h,
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                children: [
                  /// 🔵 Botón deslizante
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    alignment: widget.isGenderSelected
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      width: 132.5.w,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            offset: Offset(0, 3),
                            color: Colors.black.withOpacity(0.2),
                          ),
                        ],
                      ),
                    ),
                  ),

                  /// 🧑‍🤝‍🧑 Contenido
                  Row(
                    children: [
                      /// 👨 Hombre
                      Expanded(
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.male,
                                color: widget.isGenderSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "Hombre",
                                style: TextStyle(
                                  color: widget.isGenderSelected
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      /// 👩 Mujer
                      Expanded(
                        child: Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.female,
                                color: !widget.isGenderSelected
                                    ? Colors.white
                                    : Colors.black,
                              ),
                              const SizedBox(width: 6),
                              Text(
                                "Mujer",
                                style: TextStyle(
                                  color: !widget.isGenderSelected
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
