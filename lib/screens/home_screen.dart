import 'package:flutter/material.dart';

class Dimensions {
  Dimensions._();
  static const double padding = 15.0;
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
                padding: const EdgeInsets.only(left: 65.0, right: 65.0),
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
                        fontWeight: FontWeight.w300,
                      ),
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
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFFFFF).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 41,
                      width: 106,
                      child: const Center(
                        child: Text(
                          "Today",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: "inter",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF000000).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 41,
                      width: 134,
                      child: const Center(
                        child: Text(
                          "Next Day",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "inter",
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
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
                            child: Container(
                              height: 158,
                              width: MediaQuery.of(context).size.width * 0.18,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFF748BD9),
                                    Color(0xFF7087D3),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(4.0),
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Color(0xFFA8B8EC),
                                      Color(0xFF6B84D8),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(46),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.only(top: 15.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Now",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "circular",
                                          fontSize: 16,
                                        ),
                                      ),
                                      Image(
                                        image: AssetImage(
                                          "asset/partly_cloudy.png",
                                        ),
                                        height: 60,
                                      ),
                                      Text(
                                        "13°",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "circular",
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
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
                                const SizedBox(height: 50), // Space for curve
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF4B66B5),
                                        Color(0xFFC4CDEE),
                                      ],
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Image(
                                        image: AssetImage("asset/sunset.png"),
                                        height: 50,
                                        color: Colors.white,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: const [
                                            Text(
                                              "Sunset",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: "circular",
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "6:30 PM",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: "circular",
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: const [
                                            Text(
                                              "Sunrise",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontFamily: "circular",
                                                color: Colors.white,
                                              ),
                                            ),
                                            Text(
                                              "6:30 AM",
                                              style: TextStyle(
                                                fontSize: 20,
                                                fontFamily: "circular",
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF4B66B5),
                                        Color(0xFFC4CDEE),
                                      ],
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
                                  width:
                                      MediaQuery.of(context).size.width * 0.7,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        const Image(
                                          image: AssetImage(
                                            "asset/sunrise.png",
                                          ),
                                          height: 50,
                                          color: Color.fromARGB(
                                            255,
                                            214,
                                            214,
                                            214,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Text(
                                                "UV Index",
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: "circular",
                                                  color: Colors.grey[300],
                                                ),
                                              ),
                                              Text(
                                                "1 low",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: "circular",
                                                  color: Colors.grey[300],
                                                ),
                                              ),
                                            ],
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

// Custom Clipper for a circular segment shape
class BottomContainerClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final width = size.width;
    final height = size.height;

    // Start at bottom-left
    path.moveTo(0, height);
    path.lineTo(0, 70); // Low start on left

    // Circular arc-like curve
    path.quadraticBezierTo(
      width * 0.25,
      0, // Control point for left rise
      width * 0.5,
      0, // Stable middle (lowest point of "circle")
    );
    path.quadraticBezierTo(
      width * 0.75,
      0, // Control point for right descent
      width,
      70, // Low end on right
    );

    // Complete the shape
    path.lineTo(width, height);
    path.lineTo(0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
