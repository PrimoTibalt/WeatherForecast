class WeatherGeneral {
  final String weather;
  final String description;
  final String icon;

  WeatherGeneral(this.weather, this.description, this.icon);

  factory WeatherGeneral.fromJson(Map<String, dynamic> json) {
    return WeatherGeneral(json['main'], json['description'], json['icon']);
  }
}
