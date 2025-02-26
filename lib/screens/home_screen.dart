import 'package:flutter/material.dart';

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
                  padding: const EdgeInsets.only(top: 47.0),
                  child: Text(
                    "Dhaka",
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: "inter",
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Text(
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
                    Flexible(
                      child: Text(
                        "13°",
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.3,
                          fontFamily: "circular",
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Partly Cloud  -  H:17o  L:4o",
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
                        color: Color(0xFFFFFFFF).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 41,
                      width: 106,
                      child: Center(
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
                        color: Color(0xFF000000).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      height: 41,
                      width: 134,
                      child: Center(
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
                      // Hourly containers (unchanged for brevity)
                      Row(
                        children: [
                          Container(
                            height: 158,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF748BD9), Color(0xFF7087D3)],
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFA8B8EC),
                                    Color(0xFF6B84D8),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(46),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
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
                                    Image.asset(
                                      "asset/partly_cloudy.png",
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
                          const SizedBox(width: 15),
                          // Add other hourly containers as needed
                          Container(
                            height: 158,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF748BD9), Color(0xFF7087D3)],
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFA8B8EC),
                                    Color(0xFF6B84D8),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(46),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
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
                                    Image.asset(
                                      "asset/partly_cloudy.png",
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
                          const SizedBox(width: 15),
                          // Add other hourly containers as needed
                          Container(
                            height: 158,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF748BD9), Color(0xFF7087D3)],
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFA8B8EC),
                                    Color(0xFF6B84D8),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(46),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
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
                                    Image.asset(
                                      "asset/partly_cloudy.png",
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
                          const SizedBox(width: 15),
                          // Add other hourly containers as needed
                          Container(
                            height: 158,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomLeft,
                                colors: [Color(0xFF748BD9), Color(0xFF7087D3)],
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFA8B8EC),
                                    Color(0xFF6B84D8),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(46),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
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
                                    Image.asset(
                                      "asset/partly_cloudy.png",
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
                          const SizedBox(width: 15),
                          // Add other hourly containers as needed
                          Container(
                            height: 158,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF748BD9), Color(0xFF7087D3)],
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFA8B8EC),
                                    Color(0xFF6B84D8),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(46),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
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
                                    Image.asset(
                                      "asset/partly_cloudy.png",
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
                          const SizedBox(width: 15),
                          // Add other hourly containers as needed
                          Container(
                            height: 158,
                            width: MediaQuery.of(context).size.width * 0.18,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [Color(0xFF748BD9), Color(0xFF7087D3)],
                              ),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(4.0),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Color(0xFFA8B8EC),
                                    Color(0xFF6B84D8),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(46),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 15.0),
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
                                    Image.asset(
                                      "asset/partly_cloudy.png",
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
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 32),
              // Comment: Changed Expanded to Flexible and made bottom section height dynamic
              Flexible(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Stack(
                    clipBehavior:
                        Clip.none, // Allows children to overflow the Stack's bounds
                    children: [
                      Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height * 0.3,
                          minHeight: 180,
                        ),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xFF97ABFF), Color(0xFF123597)],
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(150),
                            topRight: Radius.circular(150),
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
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
                                          MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Image.asset(
                                            "asset/sunset.png",
                                            height: 50,
                                            color: Colors.white,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              children: [
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
                                              children: [
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
                                    SizedBox(height: 20),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
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
                                          MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          left: 15.0,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              "asset/sunrise.png",
                                              height: 50,
                                              color: Color.fromARGB(
                                                255,
                                                214,
                                                214,
                                                214,
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(
                                                8.0,
                                              ),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    "UV Index",
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: "circular",
                                                      color: Color.fromARGB(
                                                        255,
                                                        201,
                                                        201,
                                                        201,
                                                      ),
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
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom:
                            200, // Increased to push it higher, overlapping the edge
                        right:
                            MediaQuery.of(context).size.width / 2 -
                            30, // Still centered horizontally
                        child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff92a3db), // First color #92a3db
                                Color(0xff536dc2), // Second color #536dc2
                              ],
                            ),
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color: Color(0xFF4461bd), // Stroke color
                              width: 9.0, // Stroke width
                            ),
                          ),
                          child: Center(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 32.0),
                                  child: Image.asset(
                                    "asset/arrow_up.png",
                                    height: 20,
                                  ),
                                ),
                              ],
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
