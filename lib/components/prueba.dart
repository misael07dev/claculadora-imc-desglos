import 'package:flutter/material.dart';

class Prueba extends StatefulWidget {
  const Prueba({super.key});

  @override
  State<Prueba> createState() => _GenderToggleState();
}

class _GenderToggleState extends State<Prueba> {
  bool isMaleSelected = true;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMaleSelected = !isMaleSelected;
          });
        },
        child: Container(
          width: 250,
          height: 40,
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(30),
          ),
          child: Stack(
            children: [
              /// 🔵 Botón deslizante
              AnimatedAlign(
                duration: const Duration(milliseconds: 250),
                curve: Curves.easeInOut,
                alignment: isMaleSelected
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                child: Container(
                  width: 140,
                  decoration: BoxDecoration(
                    color: const Color(0xFF126BB4),
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
                            color: isMaleSelected ? Colors.white : Colors.black,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "Hombre",
                            style: TextStyle(
                              color: isMaleSelected
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
                            color: !isMaleSelected
                                ? Colors.white
                                : Colors.black,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "Mujer",
                            style: TextStyle(
                              color: !isMaleSelected
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
    );
  }
}
