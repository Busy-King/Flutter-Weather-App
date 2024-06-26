import 'package:flutter/material.dart';

class WeatherForecast extends StatelessWidget {
  final String location;
  final String time;
  final IconData icon;
  final String temp;
  const WeatherForecast ({super.key,
  required this.time,
    required this.icon,
    required this.temp,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
    width: 100,
    height: 130,
    child: Card(
    elevation: 10,
    color: Colors.lightBlueAccent,
    child: Padding(
    padding: const EdgeInsets.all(6.0),
    child: Column(
    children: [
      const SizedBox(height: 5,),
    Text(time,
    style: const TextStyle(color: Colors.white70,
    fontWeight: FontWeight.w700,fontSize: 17),),
    Icon(icon,color: Colors.white,size: 40,),
Text(temp,style: const TextStyle(color: Colors.white70,
fontWeight: FontWeight.w800,fontSize: 16,),),
]
),
),
),),]
);
  }
}
