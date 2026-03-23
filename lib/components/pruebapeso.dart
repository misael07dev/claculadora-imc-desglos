import 'package:flutter/material.dart';

class Pruebapeso extends StatefulWidget {
  const Pruebapeso({super.key});

  @override
  State<Pruebapeso> createState() => _WeightInputState();
}

class _WeightInputState extends State<Pruebapeso> {
  String selectedUnit = "kg";
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade400),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            offset: const Offset(0, 2),
            color: Colors.black.withOpacity(0.05),
          ),
        ],
      ),
      child: Row(
        children: [
          // 🔢 INPUT PESO
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  hintText: "Peso",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),

          // 📏 DIVISOR
          Container(
            width: 1,
            height: double.infinity,
            color: Colors.grey.shade300,
          ),

          // 🔽 SELECTOR KG / LB
          GestureDetector(
            onTap: _openSelector,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: double.infinity,
              child: Row(
                children: [
                  Text(
                    selectedUnit,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openSelector() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: ["kg", "lb"].map((unit) {
            return ListTile(
              title: Text(unit),
              onTap: () {
                setState(() => selectedUnit = unit);
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
