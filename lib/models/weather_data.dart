class WeatherData {
  final String city;
  final String currentTemp;
  final String condition;
  final String highTemp;
  final String lowTemp;
  final List<HourlyForecast> hourlyForecast;
  final String sunsetTime;
  final String uvIndex;

  WeatherData({
    required this.city,
    required this.currentTemp,
    required this.condition,
    required this.highTemp,
    required this.lowTemp,
    required this.hourlyForecast,
    required this.sunsetTime,
    required this.uvIndex,
  });
}

class HourlyForecast {
  final String time;
  final String iconPath;
  final String temperature;

  HourlyForecast({
    required this.time,
    required this.iconPath,
    required this.temperature,
  });
}