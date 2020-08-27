import 'package:weather/Models/Weather/WeatherModel.dart';
import 'package:share/share.dart';

import './WeatherShareService.dart';

class WeatherShareAsText extends WeatherShareService {
  WeatherShareAsText(List<WeatherModel> list) : super(list);

  @override
  share() {
    Share.share(_composeToText());
  }

  String _composeToText() {
    StringBuffer buffer = StringBuffer();
    list.forEach((element) {
      buffer.writeln('date: ' + element.additional.date);
      buffer.writeln('time: ' + element.additional.time);
      buffer.write('\ttempreture: ' + element.data.celsiusTemp);
      buffer.write('\tweather: ' + element.general.weather);
      buffer.write('\thumidity: ' + element.data.humidity.toString());
      buffer.write('\tpressure: ' + element.data.pressure.toString());
      buffer.write('\twind speed: ' + element.additional.windSpeed.toString());
      buffer.write('\twind direction: ' + element.additional.windDirection);
      buffer.writeln('');
    });
    return buffer.toString();
  }
}
