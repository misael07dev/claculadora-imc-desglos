import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:imc_calculador/core/appcolor.dart';

class AgeSlider extends StatefulWidget {
  final double edad;
  final Function(double) onAgeChange;
  const AgeSlider({super.key, required this.edad, required this.onAgeChange});

  @override
  State<AgeSlider> createState() => _AgeSliderState();
}

class _AgeSliderState extends State<AgeSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// TITULO
        Row(
          children: const [
            Icon(Icons.calendar_month, color: AppColors.primary),
            SizedBox(width: 5),
            Text("Edad", style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),

        SizedBox(height: 0.h),

        /// 🔥 SLIDER + EDAD
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 30,
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 6,
                    trackShape: CustomTrackShape(),

                    activeTrackColor: AppColors.primary,
                    inactiveTrackColor: Colors.blue.shade100,

                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 8,
                    ),
                    thumbColor: Colors.white,

                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 14,
                    ),
                    overlayColor: Colors.blue.withOpacity(0.15),

                    valueIndicatorColor: const Color(0xFF126BB4),
                  ),
                  child: Slider(
                    value: widget.edad,
                    min: 1,
                    max: 100,
                    divisions: 99,
                    label: widget.edad.toInt().toString(),
                    onChanged: (value) {
                      widget.onAgeChange(value);
                    },
                  ),
                ),
              ),
            ),

            SizedBox(width: 8.w),

            /// CAJA EDAD
            Container(
              height: 40.h,
              width: 40.w,
              alignment: Alignment.center,
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
              child: Text(
                "${widget.edad.toInt()}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            SizedBox(width: 6.w),

            /// TEXTO
            const Text(
              "años",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ],
    );
  }
}

/// 🔥 TRACK PERSONALIZADO
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
    final double trackLeft = offset.dx + 1;
    final double trackTop =
        offset.dy + (parentBox.size.height - trackHeight) / 2;

    final double trackWidth = parentBox.size.width - 20;

    return Rect.fromLTWH(trackLeft, trackTop, trackWidth, trackHeight);
  }
}
