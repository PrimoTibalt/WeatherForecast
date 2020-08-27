import 'package:flutter/material.dart';
import 'package:weather/Models/Weather/WeatherModel.dart';
import 'package:weather/Services/WeatherRowService.dart';

class WeatherDayService {
  final List<WeatherModel> weather;
  final BuildContext context;

  WeatherDayService(this.weather, this.context);

  List<Widget> separateByDays() {
    List<Widget> listOfColumn = [];
    var currentDay = '';
    this.weather.forEach((element) {
      WeatherRowService service = WeatherRowService(element, this.context);
      if (currentDay != element.additional.date && currentDay != '') {
        currentDay = element.additional.date;
        listOfColumn.add(_dayRowGenerator(element.additional.date));
      } else if (currentDay == '') {
        listOfColumn.add(_dayRowGenerator(element.additional.date));
        currentDay = element.additional.date;
      }
      listOfColumn.add(service.getRow());
    });

    return listOfColumn;
  }

  Widget _dayRowGenerator(String date) {
    DateTime dateDT = DateTime.parse(date);
    var dateNow = DateTime.now();
    var day;
    if (dateDT.isAfter(dateNow)) {
      day = _getWeekDay(dateDT.weekday);
    } else if (dateNow.day == dateDT.day &&
        dateNow.month == dateDT.month &&
        dateNow.year == dateDT.year) {
      day = 'Today';
    } else {
      day = date;
    }

    return Container(
        child:
            Text(day, style: TextStyle(color: Colors.black87, fontSize: 20)));
  }

  String _getWeekDay(int number) {
    if (number == 1) {
      return 'Monday';
    } else if (number == 2) {
      return 'Tuesday';
    } else if (number == 3) {
      return 'Wednesday';
    } else if (number == 4) {
      return 'Thursday';
    } else if (number == 5) {
      return 'Friday';
    } else if (number == 6) {
      return 'Saturday';
    } else if (number == 7) {
      return 'Sunday';
    } else {
      return 'Unknown day:' + number.toString();
    }
  }
}
