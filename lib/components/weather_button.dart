import 'package:flutter/material.dart';

class WeatherButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final bool isBold;
  final VoidCallback? onTap;

  const WeatherButton({
    super.key,
    required this.label,
    required this.backgroundColor,
    this.isBold = true,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.white.withOpacity(0.3),
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20),
        ),
        height: 41,
        width: label == "Today" ? 106 : 134,
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
              color: Colors.white,
              fontFamily: "inter",
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}