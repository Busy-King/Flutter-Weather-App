import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/next_class.dart';
import 'package:lottie/lottie.dart';

class loadingPage extends StatefulWidget {
  const loadingPage({super.key});

  @override
  State<loadingPage> createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(milliseconds: 2300),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> WeatherScreen(),));
    });

  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
  body:  PageView.builder(
      itemCount: 5,
      itemBuilder: (context,index){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(text: const TextSpan(children: <TextSpan>[
              TextSpan(text: 'Weather',style: TextStyle(color: Colors.lightBlueAccent,fontSize: 32,fontWeight: FontWeight.bold)),
              TextSpan(text: 'App',style: TextStyle(color: Colors.orange,fontSize: 32,fontWeight: FontWeight.bold)),
            ])),
            const SizedBox(height:3),
            Lottie.asset('assets/anim/Animation - 1718457258744.json'
              ,height: 100,
              reverse: true,
              repeat: true,
              fit: BoxFit.cover,
            ),
          ],
        );
      }),
        );
  }
}

