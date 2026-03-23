import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeigthAndWeigth extends StatefulWidget {
  const HeigthAndWeigth({super.key});

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
            Icon(Icons.height, color: const Color(0xFF126BB4)),
            const SizedBox(width: 5),
            const Text("Altura", style: TextStyle(fontWeight: FontWeight.bold)),

            SizedBox(width: 120.w),

            Icon(Icons.people_sharp, color: const Color(0xFF126BB4)),
            const SizedBox(width: 5),
            const Text("Peso", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),

        const SizedBox(height: 8),

        /// INPUTS
        Row(
          children: [
            /// ALTURA
            Container(
              height: 35.h,
              width: 140.w,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 177, 176, 175),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
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
                    color: Colors.black,
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
              width: 140.w,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 177, 176, 175),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black),
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
                        controller: weightController,
                        keyboardType: TextInputType.number,
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
                    color: Colors.black,
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
                    tipoHeight = unit;
                  } else {
                    tipoWeight = unit;
                  }
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
