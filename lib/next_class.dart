import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/datafile.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
String? tempValue;
String? speedValue;
String? hum;
String? press;
String? sky;
String? cloudiness;
String? Visibility;
String? loCation;
String? Feelslike;
String? city;



  Future<void> startApp()async{
    Worker instance = Worker(location: '$city' );
   await instance.getData();
   setState(() {
     tempValue = instance.temp;
     speedValue = instance.airSpeed;
     hum = instance.humidity;
     press = instance.pressure;
     sky = instance.currentSky;
     cloudiness = instance.cloudiness;
     Visibility = instance.visibility;
     loCation = instance.location;
     Feelslike = instance.feelslike;

   });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startApp();
  }
  TextEditingController search = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    if (city?.isEmpty?? true)
      {
        city = "delhi";
      }
    startApp();
    var stringValue = "$Feelslike";
    var parsedInt = double.tryParse(stringValue);
    var time = DateTime.now();
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlueAccent,shape:const RoundedRectangleBorder(),
        title: RichText(text:const TextSpan(children: <TextSpan>[
          TextSpan(text: 'Weather ',style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold)),
          TextSpan(text: ' App',style: TextStyle(color: Color.fromRGBO(240,156,22, 1),fontSize: 22,fontWeight: FontWeight.bold)),
        ]),),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             Container(
               padding: const EdgeInsets.all(2),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border: Border.all(style: BorderStyle.none),
                  color: const Color.fromRGBO(218, 237, 247, 1),),
                child: Row(
                  children: [
                    const SizedBox(width: 4,),
                    GestureDetector(
                      child: const Icon(Icons.search,size: 34,
                        color: Colors.blueAccent,),onTap: (){
                      setState(() {
                        city = search.text;
                      });
                    },),
                    Expanded(
                        child: TextField(
                           controller: search,
                          decoration:const InputDecoration( disabledBorder: OutlineInputBorder(),
                              border: InputBorder.none ,hintText: " Enter city name ",
                              contentPadding: EdgeInsets.all(10),hintStyle: TextStyle(color: Colors.blueGrey,
                                fontWeight:FontWeight.bold) ,),
                          enabled: true,)),
                  ],
                ),
              ),
            Container(
              decoration:const BoxDecoration(
              color: Colors.white60),
                child: Padding(
              padding: const EdgeInsets.all(7.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      height: 310,
        
                      child: Card(                                       //CARD WIDGET
                        color: Colors.lightBlueAccent,
                        elevation: 10,shadowColor: Colors.blueAccent,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(24))) ,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                                sigmaX: 2 ,sigmaY: 2),
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(width: 2,),
                                      Container(
                                        width: 162,
                                          child: Row(
                                            children: [
                                              const Icon(Icons.location_on,color: Colors.white,),
                                              Text('$loCation',style:const TextStyle(fontSize: 16,color: Colors.white),),
                                            ],
                                          )),
                                      const SizedBox(width: 100),
                                      Container(
                                        child: Text('${DateFormat(DateFormat.MONTH_DAY).format(time)}',
                                        style: const TextStyle(color: Colors.white),),
                                      ),

                                    ],
                                  ),
                                 const SizedBox(height: 15,),
                                  Text('$tempValue°C',style: const TextStyle(
                                      fontSize: 35,color: Colors.white,fontWeight: FontWeight.w500),),
                                 const SizedBox(height: 7,),
                                  if(sky =='Clouds') const FaIcon(FontAwesomeIcons.cloud,
                                    color: Colors.white,size: 68,)
                                  else if(sky == 'Rain') const FaIcon(
                                    FontAwesomeIcons.cloudRain,color: Colors.black54,size: 62,)
                                  else if (sky == 'Haze')
                                      const FaIcon(FontAwesomeIcons.cloudSun,color: Color.fromRGBO(240,156,22, 1),size: 65,)
                                  else if (sky == 'Thunderstorm')
                                        const FaIcon(FontAwesomeIcons.thunderstorm,color: Color.fromRGBO(138,137,136,1),size: 65,)
                                  else if(sky == 'Drizzle')
                                          const Icon(Icons.cloudy_snowing,color: Colors.black54,size: 62,)
                                  else
                                          const Icon(Icons.sunny,color: Color.fromRGBO(240,156,22, 1),size: 65,) ,
                                  const SizedBox(height: 8,),
                                  Text("$sky",style: const TextStyle(color: Colors.white,fontSize: 26,
                                      fontWeight: FontWeight.w500),),
                                  const SizedBox(height: 30,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Feels like $Feelslike',style: const TextStyle(fontSize: 16,
                                          color: Colors.white,fontWeight: FontWeight.w400),),
                                     if(parsedInt != null)
                                       if(parsedInt<25.00)
                                         const Icon(Icons.thermostat, color: Colors.blueAccent,
                                          size: 19,
                                          weight: 90,)
                                      else if(parsedInt != null)
                                        if(parsedInt<30.00 && parsedInt>=25.00)
                                          const Icon(Icons.thermostat, color: Colors.orangeAccent,
                                         size: 19,
                                         weight: 90,)
                                      else
                                          const Icon(Icons.thermostat, color: Colors.red,
                                         size: 19,
                                         weight: 90,)
        
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    const Align(                                                     //WEATHER FORECAST HEADING
                        alignment: Alignment.centerLeft ,
                        child: Text('Additional information',
                          style: TextStyle(fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Color.fromRGBO(30, 61, 66, 1),),)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(child: const Icon(Icons.arrow_forward)),
                      ],
                    ),
                    const SizedBox(height:2),
                    SingleChildScrollView(                 //SCROLL VIEW
                      scrollDirection: Axis.horizontal,
                      child :Row(
                        children: [
                          AdditionalInfo(
                            icon: Icons.water_drop,
                            label: 'Humidity',
                            value: '$hum %',
                          ),
                          AdditionalInfo(
                            value: '$speedValue m/s',
                            label: 'Wind Speed',
                            icon: Icons.air,
                          ),
                          AdditionalInfo(
                            icon: Icons.beach_access,
                            label: 'Pressure',
                            value:'$press hPa' ,
                          ),
                          AdditionalInfo(
                            icon: Icons.wb_cloudy_sharp,
                            label: 'Clouds',
                            value: '$cloudiness'+'%',
                          ),
                          AdditionalInfo(
                            value: '$Visibility Km',
                            label: 'Visibility',
                            icon:Icons.remove_red_eye_rounded,
                          ),
                        ],
                      ),),
                    const SizedBox(height: 30,),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Icon(Icons.emoji_objects_outlined),
                           Text("Made by #Busy king",style: const TextStyle(fontWeight: FontWeight.w800,),),
                        ],
                      ),
                    ),
                    const SizedBox(height: 60,),//ADDITIONAL INFORMATION
        
                        ],),
                ),
              ),
          ],
        ),
      ),
     );

  }
}
