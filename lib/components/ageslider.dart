import 'package:flutter/material.dart';

class AgeSlider extends StatefulWidget {
  const AgeSlider({super.key});

  @override
  State<AgeSlider> createState() => _AgeSliderState();
}

class _AgeSliderState extends State<AgeSlider> {
  double edad = 25;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: const [
            SizedBox(width: 30),
            Icon(Icons.calendar_month, color: Color(0xFF126BB4)),
            SizedBox(width: 5),
            Text("Edad"),
          ],
        ),

        const SizedBox(height: 1),

        Row(
          children: [
            const SizedBox(width: 30),

            /// 🔥 CONTROL TOTAL DEL LARGO
            SizedBox(
              width: 270, // 👈 TU "trackWidth"
              child: SliderTheme(
                data: SliderTheme.of(context).copyWith(
                  trackHeight: 10, // 👈 GROSOR
                  /// 🎯 TRACK PERSONALIZADO
                  trackShape: CustomTrackShape(),

                  activeTrackColor: const Color(0xFF126BB4),
                  inactiveTrackColor: Colors.blue.shade100,

                  /// 🔘 THUMB MODERNO
                  thumbShape: const RoundSliderThumbShape(
                    enabledThumbRadius: 12,
                  ),

                  thumbColor: Colors.white,

                  overlayShape: const RoundSliderOverlayShape(
                    overlayRadius: 20,
                  ),

                  overlayColor: Colors.blue.withOpacity(0.2),

                  valueIndicatorColor: const Color(0xFF126BB4),
                ),
                child: Slider(
                  value: edad,
                  min: 1,
                  max: 100,
                  divisions: 99,
                  label: edad.toInt().toString(),
                  onChanged: (value) {
                    setState(() {
                      edad = value;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(width: 10),

            Text(
              "${edad.toInt()} Años",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF126BB4),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// 🔥 TRACK PERSONALIZADO (esto simula el "trackWidth real")
class CustomTrackShape extends RoundedRectSliderTrackShape {
  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    Offset offset = Offset.zero,
    required SliderThemeData sliderTheme,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight!;
    final double trackLeft = offset.dx + 10; // 👈 margen interno izquierdo
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;

    final double trackWidth =
        parentBox.size.width - 20; // 👈 reduce ancho interno

    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
