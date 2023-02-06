import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wather_apk/Presemtation/Screen_1.dart';
import 'package:wather_apk/domain/model.dart';
import 'package:wather_apk/domain/netWorkService.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    gotohomeScreen(context);
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: screenheight,
        width: screenwidth,
        color: Color.fromARGB(255, 235, 246, 249),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Weather App',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            )
          ],
        )),
      ),
    );
  }

  Future gotohomeScreen(BuildContext context) async {
    await Future.delayed(Duration(seconds: 3));
    
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Screen_1(),
        ));
  }
}
