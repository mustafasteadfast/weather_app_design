import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import '../main.dart';
import '../models/weather_data.dart';
import '../components/hourly_weather_container.dart';
import '../components/weather_button.dart';
import '../components/info_container.dart';
import '../components/bottom_container_clipper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late WeatherData weatherData;
  bool isLoading = true;
  bool showNextDay = false;
  late List<dynamic> fullHourlyForecast;
  late dynamic weatherJson;

  @override
  void initState() {
    super.initState();
    weatherData = WeatherData(
      city: "Dhaka",
      currentTemp: "13°",
      condition: "Partly Cloud",
      highTemp: "17°",
      lowTemp: "4°",
      hourlyForecast: List.generate(
        6,
        (index) => HourlyForecast(
          time: "Now",
          iconPath: "asset/partly_cloudy.json",
          temperature: "13°",
        ),
      ),
      sunsetTime: "6:30 PM",
      uvIndex: "1 low",
    );
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    const String apiKey = "fb205e43e41c4e0db8053302252702";
    try {
      print("Fetching weather data..."); // Debug log
      final response = await http.get(
        Uri.parse(
          'http://api.weatherapi.com/v1/forecast.json?key=$apiKey&q=Dhaka&days=3&aqi=yes',
        ),
      );

      if (response.statusCode == 200) {
        print("Weather data fetched successfully"); // Debug log
        weatherJson = jsonDecode(response.body);
        fullHourlyForecast =
            weatherJson['forecast']['forecastday'][0]['hour'] +
            weatherJson['forecast']['forecastday'][1]['hour'];

        setState(() {
          weatherData = _buildWeatherData(0);
          isLoading = false;
        });
      } else {
        print(
          "Failed to fetch weather data: ${response.statusCode}",
        ); // Debug log
        setState(() => isLoading = false);
      }
    } catch (e) {
      print("Error fetching weather data: $e"); // Debug log
      setState(() => isLoading = false);
    }
  }

  WeatherData _buildWeatherData(int dayOffset) {
    final current = weatherJson['current'];
    final todayForecast = weatherJson['forecast']['forecastday'][0]['day'];
    final now = DateTime.now().toLocal();
    final currentHour = now.hour;

    int startIndex = fullHourlyForecast.indexWhere((entry) {
      final forecastTime = DateTime.parse(entry['time']).toLocal();
      return forecastTime.hour > currentHour;
    });

    if (startIndex == -1) startIndex = 0;

    if (dayOffset > 0) {
      startIndex += 24;
      if (startIndex >= fullHourlyForecast.length) startIndex = 0;
    }

    return WeatherData(
      city: weatherJson['location']['name'],
      currentTemp: "${current['temp_c'].round()}°",
      condition: current['condition']['text'],
      highTemp: "${todayForecast['maxtemp_c'].round()}°",
      lowTemp: "${todayForecast['mintemp_c'].round()}°",
      hourlyForecast:
          fullHourlyForecast
              .skip(startIndex)
              .take(6)
              .map(
                (entry) => HourlyForecast(
                  time: _formatTo12Hour(
                    DateTime.parse(entry['time']).toLocal(),
                  ),
                  iconPath: _mapConditionToIcon(entry['condition']['text']),
                  temperature: "${entry['temp_c'].round()}°",
                ),
              )
              .toList(),
      sunsetTime: weatherJson['forecast']['forecastday'][0]['astro']['sunset'],
      uvIndex: "${current['uv'].round()}",
    );
  }

  String _formatTo12Hour(DateTime dateTime) {
    final hour = dateTime.hour % 12 == 0 ? 12 : dateTime.hour % 12;
    final period = dateTime.hour < 12 ? 'AM' : 'PM';
    return "$hour $period";
  }

  String _mapConditionToIcon(String condition) {
    switch (condition.toLowerCase()) {
      case "sunny":
      case "clear":
        return "asset/sunny.json";
      case "partly cloudy":
        return "asset/partly_cloudy.json";
      case "cloudy":
      case "overcast":
        return "asset/cloudy.json";
      case "rain":
      case "light rain":
      case "moderate rain":
      case "heavy rain":
        return "asset/rain.json";
      default:
        return "asset/partly_cloudy.json";
    }
  }

  void _toggleDay(bool nextDay) {
    setState(() {
      showNextDay = nextDay;
      weatherData = _buildWeatherData(nextDay ? 1 : 0);
    });
  }

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
          child:
              isLoading
                  ? const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  )
                  : Column(
                    children: [
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: Dimensions.padding,
                          ),
                          child: Text(
                            weatherData.city,
                            style: Theme.of(
                              context,
                            ).textTheme.bodyLarge?.copyWith(
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
                            Lottie.asset(
                              weatherData.hourlyForecast[0].iconPath,
                              height: 130,
                              width: 135,
                              fit: BoxFit.contain,
                            ),
                            Text(
                              weatherData.currentTemp,
                              style: const TextStyle(
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
                      Text(
                        "${weatherData.condition}  -  H:${weatherData.highTemp}  L:${weatherData.lowTemp}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: "circular",
                          fontSize: 23,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 100.0,
                          right: 93.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            WeatherButton(
                              label: "Today",
                              backgroundColor: const Color(0xFFFFFFFF),
                              onTap: () => _toggleDay(false),
                            ),
                            WeatherButton(
                              label: "Next Day",
                              backgroundColor: const Color(0xFF000000),
                              onTap: () => _toggleDay(true),
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
                            children:
                                weatherData.hourlyForecast
                                    .map(
                                      (forecast) => Padding(
                                        padding: const EdgeInsets.only(
                                          right: 15,
                                        ),
                                        child: HourlyWeatherContainer(
                                          time: forecast.time,
                                          iconPath: forecast.iconPath,
                                          temperature: forecast.temperature,
                                        ),
                                      ),
                                    )
                                    .toList(),
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
                                    maxHeight:
                                        MediaQuery.of(context).size.height *
                                        0.3,
                                    minHeight: 180,
                                  ),
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xFF97ABFF),
                                        Color(0xFF123597),
                                      ],
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const SizedBox(height: 50),
                                        InfoContainer(
                                          title: "Sunset",
                                          value: weatherData.sunsetTime,
                                          iconPath: "asset/sunset.json",
                                          isHorizontal: true,
                                          iconColor: Colors.white,
                                        ),
                                        const SizedBox(height: 20),
                                        InfoContainer(
                                          title: "UV Index",
                                          value: weatherData.uvIndex,
                                          iconPath: "asset/uv_index.json",
                                          isHorizontal: true,
                                          iconColor: const Color.fromARGB(
                                            255,
                                            214,
                                            214,
                                            214,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 200,
                                left:
                                    MediaQuery.of(context).size.width / 2 - 35,
                                child: Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xff92a3db),
                                        Color(0xff536dc2),
                                      ],
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
