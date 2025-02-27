import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class InfoContainer extends StatelessWidget {
  final String title;
  final String value;
  final String? iconPath;
  final Color? iconColor;
  final bool isHorizontal;

  const InfoContainer({
    super.key,
    required this.title,
    required this.value,
    this.iconPath,
    this.iconColor,
    this.isHorizontal = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF4B66B5), Color(0xFFC4CDEE)],
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.white.withOpacity(0.1),
          width: 1.5,
        ),
      ),
      height: 80,
      width: MediaQuery.of(context).size.width * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isHorizontal
            ? Row(
                mainAxisAlignment: iconPath != null
                    ? MainAxisAlignment.spaceEvenly
                    : MainAxisAlignment.start,
                children: [
                  if (iconPath != null)
                    Lottie.asset(
                      iconPath!,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "circular",
                            color: iconColor ?? Colors.white,
                          ),
                        ),
                        Text(
                          value,
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: "circular",
                            color: iconColor ?? Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (iconPath != null)
                    Lottie.asset(
                      iconPath!,
                      height: 50,
                      fit: BoxFit.contain,
                    ),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontFamily: "circular",
                      color: iconColor ?? Colors.white,
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: "circular",
                      color: iconColor ?? Colors.white,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}