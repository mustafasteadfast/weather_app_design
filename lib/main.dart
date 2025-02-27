// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:lottie/lottie.dart'; // Add Lottie import

// void main() {
//   runApp(const MaterialApp(home: HomeScreen()));
// }

// class Dimensions {
//   Dimensions._();
//   static const double padding = 15.0;
// }

// // Weather Data Model
// class WeatherData {
//   final String city;
//   final String currentTemp;
//   final String condition;
//   final String highTemp;
//   final String lowTemp;
//   final List<HourlyForecast> hourlyForecast;
//   final String sunsetTime;
//   final String uvIndex;

//   WeatherData({
//     required this.city,
//     required this.currentTemp,
//     required this.condition,
//     required this.highTemp,
//     required this.lowTemp,
//     required this.hourlyForecast,
//     required this.sunsetTime,
//     required this.uvIndex,
//   });
// }

// class HourlyForecast {
//   final String time;
//   final String iconPath; // Will now point to Lottie files
//   final String temperature;

//   HourlyForecast({
//     required this.time,
//     required this.iconPath,
//     required this.temperature,
//   });
// }

// // Reusable Hourly Weather Container with Lottie
// class HourlyWeatherContainer extends StatelessWidget {
//   final String time;
//   final String iconPath;
//   final String temperature;

//   const HourlyWeatherContainer({
//     super.key,
//     required this.time,
//     required this.iconPath,
//     required this.temperature,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 158,
//       width: MediaQuery.of(context).size.width * 0.18,
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//           colors: [Color(0xFF748BD9), Color(0xFF7087D3)],
//         ),
//         borderRadius: BorderRadius.circular(50),
//       ),
//       child: Container(
//         margin: const EdgeInsets.all(4.0),
//         decoration: BoxDecoration(
//           gradient: const LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Color(0xFFA8B8EC), Color(0xFF6B84D8)],
//           ),
//           borderRadius: BorderRadius.circular(46),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.only(top: 15.0),
//           child: Column(
//             children: [
//               Text(
//                 time,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontFamily: "circular",
//                   fontSize: 16,
//                 ),
//               ),
//               Lottie.asset(
//                 iconPath,
//                 height: 60,
//                 fit: BoxFit.contain,
//               ), // Replaced Image.asset with Lottie.asset
//               Text(
//                 temperature,
//                 style: const TextStyle(
//                   color: Colors.white,
//                   fontFamily: "circular",
//                   fontSize: 20,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Reusable Button Container with Tap Effect
// class WeatherButton extends StatelessWidget {
//   final String label;
//   final Color backgroundColor;
//   final bool isBold;
//   final VoidCallback? onTap;

//   const WeatherButton({
//     super.key,
//     required this.label,
//     required this.backgroundColor,
//     this.isBold = true,
//     this.onTap,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(20),
//       splashColor: Colors.white.withOpacity(0.3),
//       child: Container(
//         decoration: BoxDecoration(
//           color: backgroundColor.withOpacity(0.1),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         height: 41,
//         width: label == "Today" ? 106 : 134,
//         child: Center(
//           child: Text(
//             label,
//             style: TextStyle(
//               fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
//               color: Colors.white,
//               fontFamily: "inter",
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ),
//       ),
//     );
//   }
// }

// // Reusable Info Container with Lottie for Sunset
// class InfoContainer extends StatelessWidget {
//   final String title;
//   final String value;
//   final String? iconPath;
//   final Color? iconColor;
//   final bool isHorizontal;

//   const InfoContainer({
//     super.key,
//     required this.title,
//     required this.value,
//     this.iconPath,
//     this.iconColor,
//     this.isHorizontal = true,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         gradient: const LinearGradient(
//           colors: [Color(0xFF4B66B5), Color(0xFFC4CDEE)],
//           begin: Alignment.bottomRight,
//           end: Alignment.topLeft,
//         ),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: Colors.white.withOpacity(0.1),
//           width: 1.5,
//         ),
//       ),
//       height: 80,
//       width: MediaQuery.of(context).size.width * 0.7,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: isHorizontal
//             ? Row(
//                 mainAxisAlignment: iconPath != null
//                     ? MainAxisAlignment.spaceEvenly
//                     : MainAxisAlignment.start,
//                 children: [
//                   if (iconPath != null)
//                     Lottie.asset(
//                       iconPath!,
//                       height: 50,
//                       fit: BoxFit.contain,
//                     ), // Replaced Image.asset with Lottie.asset
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           title,
//                           style: TextStyle(
//                             fontSize: 16,
//                             fontFamily: "circular",
//                             color: iconColor ?? Colors.white,
//                           ),
//                         ),
//                         Text(
//                           value,
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontFamily: "circular",
//                             color: iconColor ?? Colors.white,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               )
//             : Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   if (iconPath != null)
//                     Lottie.asset(
//                       iconPath!,
//                       height: 50,
//                       fit: BoxFit.contain,
//                     ),
//                   Text(
//                     title,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontFamily: "circular",
//                       color: iconColor ?? Colors.white,
//                     ),
//                   ),
//                   Text(
//                     value,
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontFamily: "circular",
//                       color: iconColor ?? Colors.white,
//                     ),
//                   ),
//                 ],
//               ),
//       ),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   late WeatherData weatherData;
//   bool isLoading = true;
//   bool showNextDay = false;
//   late List<dynamic> fullHourlyForecast;
//   late dynamic weatherJson;

//   @override
//   void initState() {
//     super.initState();
//     weatherData = WeatherData(
//       city: "Dhaka",
//       currentTemp: "13°",
//       condition: "Partly Cloud",
//       highTemp: "17°",
//       lowTemp: "4°",
//       hourlyForecast: List.generate(
//         6,
//         (index) => HourlyForecast(
//           time: "Now",
//           iconPath: "asset/partly_cloudy.json",
//           temperature: "13°",
//         ),
//       ),
//       sunsetTime: "6:30 PM",
//       uvIndex: "1 low",
//     );
//     fetchWeatherData();
//   }

//   Future<void> fetchWeatherData() async {
//     const String apiKey = "fb205e43e41c4e0db8053302252702"; // Your WeatherAPI.com key
//     try {
//       final response = await http.get(
//         Uri.parse(
//           'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=Dhaka&days=3&aqi=yes',
//         ),
//       );

//       if (response.statusCode == 200) {
//         weatherJson = jsonDecode(response.body);
//         fullHourlyForecast = weatherJson['forecast']['forecastday'][0]['hour'] +
//             weatherJson['forecast']['forecastday'][1]['hour'];

//         setState(() {
//           weatherData = _buildWeatherData(fullHourlyForecast, 0);
//           isLoading = false;
//         });
//       } else {
//         setState(() => isLoading = false);
//       }
//     } catch (e) {
//       setState(() => isLoading = false);
//     }
//   }

//   WeatherData _buildWeatherData(List<dynamic> hourlyList, int startIndex) {
//     final current = weatherJson['current'];
//     final todayForecast = weatherJson['forecast']['forecastday'][0]['day'];
//     return WeatherData(
//       city: weatherJson['location']['name'],
//       currentTemp: "${current['temp_c'].round()}°",
//       condition: current['condition']['text'],
//       highTemp: "${todayForecast['maxtemp_c'].round()}°",
//       lowTemp: "${todayForecast['mintemp_c'].round()}°",
//       hourlyForecast: hourlyList
//           .skip(startIndex)
//           .take(6)
//           .map((entry) => HourlyForecast(
//                 time: _formatTo12Hour(
//                     DateTime.parse(entry['time']).toLocal()),
//                 iconPath: _mapConditionToIcon(entry['condition']['text']),
//                 temperature: "${entry['temp_c'].round()}°",
//               ))
//           .toList(),
//       sunsetTime: weatherJson['forecast']['forecastday'][0]['astro']['sunset'],
//       uvIndex: "${current['uv'].round()}",
//     );
//   }

//   String _formatTo12Hour(DateTime dateTime) {
//     final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
//     final period = dateTime.hour < 12 ? 'AM' : 'PM';
//     return "$hour $period";
//   }

//   String _mapConditionToIcon(String condition) {
//     switch (condition.toLowerCase()) {
//       case "sunny":
//       case "clear":
//         return "assets/sunny.json";
//       case "partly cloudy":
//         return "assets/partly_cloudy.json";
//       case "cloudy":
//       case "overcast":
//         return "assets/cloudy.json";
//       case "rain":
//       case "light rain":
//       case "moderate rain":
//       case "heavy rain":
//         return "assets/rain.json";
//       default:
//         return "assets/partly_cloudy.json";
//     }
//   }

//   void _toggleDay(bool nextDay) {
//     setState(() {
//       showNextDay = nextDay;
//       weatherData = _buildWeatherData(
//         fullHourlyForecast,
//         nextDay ? 24 : 0,
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [Color(0xFF97ABFF), Color(0xFF123597)],
//           ),
//         ),
//         child: SafeArea(
//           child: isLoading
//               ? const Center(child: CircularProgressIndicator(color: Colors.white))
//               : Column(
//                   children: [
//                     Center(
//                       child: Padding(
//                         padding: const EdgeInsets.only(top: Dimensions.padding),
//                         child: Text(
//                           weatherData.city,
//                           style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     const Text(
//                       "📍 Current Location",
//                       style: TextStyle(color: Colors.white),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 27.0, right: 27.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Lottie.asset(
//                             weatherData.hourlyForecast[0].iconPath,
//                             height: 130,
//                             width: 135,
//                             fit: BoxFit.contain,
//                           ), // Replaced Image.asset with Lottie.asset
//                           Text(
//                             weatherData.currentTemp,
//                             style: const TextStyle(
//                               fontSize: 122,
//                               fontFamily: "circular",
//                               color: Colors.white,
//                               fontWeight: FontWeight.w300,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ],
//                       ),
//                     ),
//                     Text(
//                       "${weatherData.condition}  -  H:${weatherData.highTemp}  L:${weatherData.lowTemp}",
//                       style: const TextStyle(
//                         color: Colors.white,
//                         fontFamily: "circular",
//                         fontSize: 23,
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     Padding(
//                       padding: const EdgeInsets.only(left: 100.0, right: 93.0),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           WeatherButton(
//                             label: "Today",
//                             backgroundColor: const Color(0xFFFFFFFF),
//                             onTap: () => _toggleDay(false),
//                           ),
//                           WeatherButton(
//                             label: "Next Day",
//                             backgroundColor: const Color(0xFF000000),
//                             onTap: () => _toggleDay(true),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(height: 15),
//                     Expanded(
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         padding: const EdgeInsets.symmetric(horizontal: 15),
//                         child: Row(
//                           children: weatherData.hourlyForecast
//                               .map((forecast) => Padding(
//                                     padding: const EdgeInsets.only(right: 15),
//                                     child: HourlyWeatherContainer(
//                                       time: forecast.time,
//                                       iconPath: forecast.iconPath,
//                                       temperature: forecast.temperature,
//                                     ),
//                                   ))
//                               .toList(),
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 32),
//                     Flexible(
//                       child: Align(
//                         alignment: Alignment.bottomCenter,
//                         child: Stack(
//                           clipBehavior: Clip.none,
//                           children: [
//                             ClipPath(
//                               clipper: BottomContainerClipper(),
//                               child: Container(
//                                 width: double.infinity,
//                                 constraints: BoxConstraints(
//                                   maxHeight: MediaQuery.of(context).size.height * 0.3,
//                                   minHeight: 180,
//                                 ),
//                                 decoration: const BoxDecoration(
//                                   gradient: LinearGradient(
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.bottomRight,
//                                     colors: [Color(0xFF97ABFF), Color(0xFF123597)],
//                                   ),
//                                 ),
//                                 child: SingleChildScrollView(
//                                   child: Column(
//                                     mainAxisSize: MainAxisSize.min,
//                                     children: [
//                                       const SizedBox(height: 50),
//                                       InfoContainer(
//                                         title: "Sunset",
//                                         value: weatherData.sunsetTime,
//                                         iconPath: "asset/sunset.json",
//                                         isHorizontal: true,
//                                         iconColor: Colors.white,
//                                       ),
//                                       const SizedBox(height: 20),
//                                       InfoContainer(
//                                         title: "UV Index",
//                                         value: weatherData.uvIndex,
//                                         iconPath: "asset/sunrise.png", // Kept PNG here
//                                         isHorizontal: true,
//                                         iconColor: const Color.fromARGB(255, 214, 214, 214),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             Positioned(
//                               bottom: 200,
//                               left: MediaQuery.of(context).size.width / 2 - 35,
//                               child: Container(
//                                 width: 70,
//                                 height: 70,
//                                 decoration: BoxDecoration(
//                                   gradient: const LinearGradient(
//                                     begin: Alignment.topLeft,
//                                     end: Alignment.bottomRight,
//                                     colors: [Color(0xff92a3db), Color(0xff536dc2)],
//                                   ),
//                                   borderRadius: BorderRadius.circular(50),
//                                   border: Border.all(
//                                     color: const Color(0xFF4461bd),
//                                     width: 9.0,
//                                   ),
//                                 ),
//                                 child: const Center(
//                                   child: Padding(
//                                     padding: EdgeInsets.only(top: 32.0),
//                                     child: Image(
//                                       image: AssetImage("asset/arrow_up.png"),
//                                       height: 20,
//                                     ),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//         ),
//       ),
//     );
//   }
// }

// class BottomContainerClipper extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     final path = Path();
//     final width = size.width;
//     final height = size.height;

//     path.moveTo(0, height);
//     path.lineTo(0, 70);
//     path.quadraticBezierTo(width * 0.25, 0, width * 0.5, 0);
//     path.quadraticBezierTo(width * 0.75, 0, width, 70);
//     path.lineTo(width, height);
//     path.lineTo(0, height);
//     path.close();

//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) => false;
// }
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const MaterialApp(home: HomeScreen()));
}

class Dimensions {
  Dimensions._();
  static const double padding = 15.0;
}