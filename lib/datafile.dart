import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:core';

class Worker {
  final String location;
  String? temp;
  String? humidity;
  String? airSpeed;
  String? pressure;
  String? currentSky;
  String? cloudiness;
  String? visibility;
  String? feelslike;

  Worker({required this.location});

  Future<void> getData() async {
    final apiKey = '' ;   //ENTER YOUR API KEY
    final url = Uri.https('api.openweathermap.org', '/data/2.5/weather',
        {'q': location, 'appid': apiKey});

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map data = jsonDecode(response.body);
      final Map mainData = data['main'];

      // TEMP AND HUMIDITY
      double getTemp = mainData['temp']-273.15.toDouble();
      int getHumidity = mainData['humidity'].toInt();
      int getPressure = mainData['pressure'].toInt();
      double feelsLike = mainData['feels_like']-273.15.toDouble();

      // WIND SPEED (Handle potential string value)
      double getAirSpeed = data['wind']['speed'].toDouble();
      String getSky = data['weather'][0]['main'].toString();
      String getCloud = data['clouds']['all'].toString();
      double getVisibility = data ['visibility']/1000 .toDouble();

      temp = getTemp.toStringAsFixed(2);
      humidity = getHumidity.toString();
      pressure = getPressure.toString();
      airSpeed = getAirSpeed.toString();
      currentSky = getSky;
      cloudiness = getCloud;
      visibility = getVisibility.toString();
      feelslike = feelsLike.toStringAsFixed(2);

    } else {
      temp= 'N/A';
      humidity = 'N/A';
      pressure='N/A';
      airSpeed = 'N/A';
      currentSky = 'N/A';
      cloudiness = 'N/A';
      visibility = 'N/A';
      feelslike = 'N/A';
    }
  }
}


