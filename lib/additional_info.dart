import 'package:flutter/material.dart';

class AdditionalInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const AdditionalInfo({super.key,
  required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Card(
            color: Colors.lightBlueAccent,

            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                    child: Column(
                      children: [
                        Icon(icon,size: 55,color: Colors.white,),
                        Text(label ,style: const TextStyle(fontWeight: FontWeight.w800,color: Colors.white),),
                        Text(value ,style: const TextStyle(fontWeight:FontWeight.w500,color: Colors.white),)
                      ],
                    ),
                  ),
            ),
          ),
        ),
      ],);
  }
}





