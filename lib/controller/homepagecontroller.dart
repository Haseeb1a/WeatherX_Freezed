import 'dart:async';

import 'package:checkweather/model/weather_model.dart';
import 'package:checkweather/services/weather_api.dart';
import 'package:flutter/material.dart';

class Homepagecontroller extends ChangeNotifier {
  //WeatherApiclient client = WeatherApiclient();
  WeatherResponse? data;
  String searched = "london";
  final TextEditingController searchcontroller = TextEditingController();
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;
  Future<void> getData() async {
    print(searched);

    data = await WeatherConnection().fetchWeatherData(searched);
  }

  searcheds() {
    searched = searchcontroller.text;
    getData();

    searched;
    notifyListeners();
  }

  clearsearch() {
    searchcontroller.clear();
  }
}
