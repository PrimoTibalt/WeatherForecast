class WeatherPreciseData {
  final num temp;
  final num feelsLike;
  final num tempMin;
  final num tempMax;
  final num pressure;
  final num seaLevel;
  final num grndLevel;
  final num humidity;
  final num tempKf;

  num get celsiusTemp => (temp - 273.15).round();

  WeatherPreciseData(this.temp, this.feelsLike, this.tempMin, this.tempMax,
      this.pressure, this.seaLevel, this.grndLevel, this.humidity, this.tempKf);

  factory WeatherPreciseData.fromJson(Map<String, dynamic> json) {
    return WeatherPreciseData(
        json['temp'],
        json['feels_like'],
        json['temp_min'],
        json['temp_max'],
        json['pressure'],
        json['sea_level'],
        json['grnd_level'],
        json['humidity'],
        json['temp_kf']);
  }
}
