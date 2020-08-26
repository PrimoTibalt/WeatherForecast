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

  String get time {
    return dtTxt.toString().substring(11, 16);
  }

  String get windDirection {
    return (windDeg > 337.5 || windDeg < 22.5)
        ? 'N'
        : (windDeg >= 22.5 && windDeg <= 67.5)
            ? 'NE'
            : (windDeg > 67.5 && windDeg < 111.5)
                ? 'E'
                : (windDeg >= 111.5 && windDeg <= 156.5)
                    ? 'SE'
                    : (windDeg > 156.5 && windDeg < 201.5)
                        ? 'S'
                        : (windDeg >= 201.5 && windDeg <= 246.5)
                            ? 'SW'
                            : (windDeg > 246.5 && windDeg < 291.5)
                                ? 'W'
                                : (windDeg >= 291.5 && windDeg <= 337.5)
                                    ? 'NW'
                                    : windDeg.toString() + '°';
  }

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
