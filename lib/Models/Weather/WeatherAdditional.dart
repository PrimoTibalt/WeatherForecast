class WeatherAdditional {
  final num cloudsAll;
  final num windSpeed;
  final num windDeg;
  final num visibility;
  final num pop;
  final num rain3h;
  final String sysPod;
  final DateTime dtTxt;

  WeatherAdditional(this.cloudsAll, this.windSpeed, this.windDeg,
      this.visibility, this.pop, this.rain3h, this.sysPod, this.dtTxt);

  factory WeatherAdditional.fromJson(Map<String, dynamic> json) {
    return WeatherAdditional(
      json['clouds']['all'],
      json['wind']['speed'],
      json['wind']['deg'],
      json['visibility'],
      json['pop'],
      json['rain'] == null ? -1.0 : json['rain']['3h'],
      json['sys']['pod'],
      DateTime.parse(json['dt_txt']),
    );
  }
}
