import 'package:flutter/material.dart';

class Heigth extends StatefulWidget {
  const Heigth({super.key});

  @override
  State<Heigth> createState() => _AprenderState();
}

class _AprenderState extends State<Heigth> {
  String tipowigth = "cm";
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 160,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 245, 243, 243),
        borderRadius: BorderRadius.circular(10),
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 05),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                style: const TextStyle(fontSize: 18),
                decoration: const InputDecoration(
                  hintText: "Altura",
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
          Container(
            width: 1,
            height: double.infinity,
            color: Colors.grey.shade300,
          ),

          GestureDetector(
            onTap: _openSelector,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              height: double.infinity,
              child: Row(
                children: [
                  Text(
                    tipowigth,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 1),
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
          children: ["cm", "ft"].map((unit) {
            return ListTile(
              title: Text(unit),
              onTap: () {
                setState(() => tipowigth = unit);
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }
}
