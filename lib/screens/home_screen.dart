import 'package:flutter/material.dart';

class Dimensions {
  Dimensions._();
  static const double padding = 15.0;
}

// Reusable Hourly Weather Container
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
              Image.asset(
                iconPath,
                height: 60,
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

// Reusable Button Container
class WeatherButton extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final bool isBold;

  const WeatherButton({
    super.key,
    required this.label,
    required this.backgroundColor,
    this.isBold = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      height: 41,
      width: label == "Today" ? 106 : 134, // Match your original widths
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
    );
  }
}

// Reusable Info Container (for Sunset/Sunrise and UV Index)
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
                    Image.asset(
                      iconPath!,
                      height: 50,
                      color: iconColor ?? Colors.white,
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
                    Image.asset(
                      iconPath!,
                      height: 50,
                      color: iconColor ?? Colors.white,
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

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF97ABFF), Color(0xFF123597)],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: Dimensions.padding),
                  child: Text(
                    "Dhaka",
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text(
                "📍 Current Location",
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 27.0, right: 27.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "asset/partly_cloudy.png",
                      height: 130,
                      width: 135,
                    ),
                    const Text(
                      "13°",
                      style: TextStyle(
                          fontSize: 122,
                          fontFamily: "circular",
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const Text(
                "Partly Cloud  -  H:17º  L:4º",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "circular",
                  fontSize: 23,
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left: 80.0, right: 80.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    WeatherButton(
                      label: "Today",
                      backgroundColor: Color(0xFFFFFFFF),
                    ),
                    WeatherButton(
                      label: "Next Day",
                      backgroundColor: Color(0xFF000000),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      Row(
                        children: List.generate(
                          6,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 15),
                            child: HourlyWeatherContainer(
                              time: "Now", // Replace with dynamic data later
                              iconPath: "asset/partly_cloudy.png",
                              temperature: "13°",
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Flexible(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      ClipPath(
                        clipper: BottomContainerClipper(),
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxHeight: MediaQuery.of(context).size.height * 0.3,
                            minHeight: 180,
                          ),
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xFF97ABFF), Color(0xFF123597)],
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const SizedBox(height: 50),
                                InfoContainer(
                                  title: "Sunset",
                                  value: "6:30 PM",
                                  iconPath: "asset/sunset.png",
                                  isHorizontal: true,
                                  iconColor: Colors.white,
                                ),
                                const SizedBox(height: 20),
                                InfoContainer(
                                  title: "UV Index",
                                  value: "1 low",
                                  iconPath: "asset/sunrise.png",
                                  isHorizontal: true,
                                  iconColor: const Color.fromARGB(255, 214, 214, 214),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 200,
                        left: MediaQuery.of(context).size.width / 2 - 35,
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [Color(0xff92a3db), Color(0xff536dc2)],
                            ),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: const Color(0xFF4461bd),
                              width: 9.0,
                            ),
                          ),
                          child: const Center(
                            child: Padding(
                              padding: EdgeInsets.only(top: 32.0),
                              child: Image(
                                image: AssetImage("asset/arrow_up.png"),
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// BottomContainerClipper (unchanged from previous)
class BottomContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    path.moveTo(0, height);
    path.lineTo(0, 70);
    path.quadraticBezierTo(width * 0.25, 0, width * 0.5, 0);
    path.quadraticBezierTo(width * 0.75, 0, width, 70);
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}