import 'package:flutter/material.dart';
import 'package:weather/Models/Weather/WeatherModel.dart';
import 'package:weather/Services/WeatherIconService.dart';

class WeatherCurrentView extends StatelessWidget {
  final WeatherModel model;

  const WeatherCurrentView(this.model);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        width: size.width,
        height: size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              child:
                  WeatherIconService(model.general.description).getLargeIcon(),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(top: 20),
            ),
            Row(
              children: [
                Container(
                  child: Text(
                      model.data.celsiusTemp + 'C | ' + model.general.weather,
                      style: TextStyle(fontSize: 32, color: Colors.blue[700])),
                  decoration: BoxDecoration(
                      border:
                          Border(bottom: BorderSide(color: Colors.grey[300]))),
                  padding: EdgeInsets.only(bottom: 40),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            child: Column(children: [
                              Text((this.model.data.humidity).toString() + '%',
                                  style: TextStyle(fontSize: 18))
                            ]),
                            width: MediaQuery.of(context).size.width / 3 - 1,
                          ),
                          Container(
                            child: Column(children: [
                              Text(this.model.data.pressure.toString() + ' hPa',
                                  style: TextStyle(fontSize: 18)),
                            ]),
                            width: MediaQuery.of(context).size.width / 3 - 1,
                            padding: EdgeInsets.all(size.width * 0.03),
                          ),
                          Container(
                            child: Column(children: [
                              Text(this.model.data.seaLevel.toString() + ' m',
                                  style: TextStyle(fontSize: 18))
                            ]),
                            width: MediaQuery.of(context).size.width / 3 - 1,
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Text(
                                    this.model.additional.windSpeed.toString() +
                                        ' km/h',
                                    style: TextStyle(fontSize: 18))
                              ],
                            ),
                            width: MediaQuery.of(context).size.width / 2 - 5,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Text(this.model.additional.windDirection,
                                    style: TextStyle(fontSize: 18))
                              ],
                            ),
                            width: MediaQuery.of(context).size.width / 2 - 5,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            Container(
              width: MediaQuery.of(context).size.width / 3 + 5,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey[300])),
              ),
              padding: EdgeInsets.only(top: 15),
            ),
            Container(
                margin: EdgeInsets.only(
                    top: 30, right: size.width / 3, left: size.width / 3),
                child: FlatButton(
                  child: Text('Share',
                      style: TextStyle(color: Colors.blue, fontSize: 24)),
                  onPressed: () {
                    // TODO: Implement sharing
                  },
                ))
          ],
        ));
  }
}
