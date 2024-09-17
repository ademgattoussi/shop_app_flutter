// import 'package:cartelly_shop/models/constants.dart';
// import 'package:flutter/material.dart';

// class ColorDot extends StatelessWidget {
//   const ColorDot({
//     super.key, required this.fillColor, this.isSelected = false,
//   });

//   final Color fillColor;
//   final bool isSelected;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2.5),
//       padding: const EdgeInsets.all(2.0),
//       height: 24,
//       width: 24,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         border: Border.all(color: isSelected ? kTextLightColor : Colors.transparent
//         ),
//       ),
//       child: Container(
//         decoration: BoxDecoration(
//           shape: BoxShape.circle,
//           color: fillColor,
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class ColorSelect extends StatefulWidget {
  final List<Color> colors; // List of colors passed from the product

  ColorSelect({required this.colors});

  @override
  _ColorSelectState createState() => _ColorSelectState();
}

class _ColorSelectState extends State<ColorSelect> {
  int selectedColorIndex = 0; // Track the selected color index

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Loop through colors and create a clickable ColorDot
          for (int i = 0; i < widget.colors.length; i++)
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedColorIndex = i; // Update the selected color index
                });
              },
              child: ColorDot(
                fillColor: widget.colors[i],
                isSelected: selectedColorIndex == i, // Check if this dot is selected
              ),
            ),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    super.key, required this.fillColor, this.isSelected = false,
  });

  final Color fillColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      padding: const EdgeInsets.all(2.0),
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? Colors.black : Colors.transparent, // Black border if selected
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: fillColor,
        ),
      ),
    );
  }
}
