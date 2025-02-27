import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HourlyWeatherContainer extends StatelessWidget {
  final String time;
  final String iconPath;
  final String temperature;

  const HourlyWeatherContainer({
    super.key,
    required this.time,
    required this.iconPath,
    required this.temperature,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 158,
      width: MediaQuery.of(context).size.width * 0.18,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF748BD9), Color(0xFF7087D3)],
        ),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Container(
        margin: const EdgeInsets.all(4.0),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFA8B8EC), Color(0xFF6B84D8)],
          ),
          borderRadius: BorderRadius.circular(46),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Column(
            children: [
              Text(
                time,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "circular",
                  fontSize: 16,
                ),
              ),
              Lottie.asset(
                iconPath,
                height: 60,
                fit: BoxFit.contain,
              ),
              Text(
                temperature,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: "circular",
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}