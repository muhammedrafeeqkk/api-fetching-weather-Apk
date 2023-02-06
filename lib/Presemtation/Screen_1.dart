import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wather_apk/Presemtation/Screen_2.dart';
import 'package:wather_apk/domain/model.dart';

class Screen_1 extends StatelessWidget {
  const Screen_1({super.key});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenheight,
            width: screenwidth,
            color: Color.fromARGB(255, 235, 246, 249),
          ),
          Positioned(
            top: screenheight * 0.7,
            child: Container(
              height: screenwidth * 0.8,
              width: screenwidth,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'weather tester',
                    style: TextStyle(fontSize: 25),
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        final getWeatherData = await Weather.getcurrentLocation(
                            latitude: 11.183780, logitude: 76.006447);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Screen_2(getWeatherData: getWeatherData),
                            ));
                      },
                      child: Text('Get Start')),
                  SizedBox(
                    height: 21,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
