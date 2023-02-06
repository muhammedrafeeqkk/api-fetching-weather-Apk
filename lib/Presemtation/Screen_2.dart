import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:wather_apk/domain/model.dart';

class Screen_2 extends StatefulWidget {
  final Weather getWeatherData;
  const Screen_2({
    super.key,
    required this.getWeatherData,
  });

  @override
  State<Screen_2> createState() => _Screen_2State();
}

class _Screen_2State extends State<Screen_2> {
  Weather? weather;
  final controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    weather = widget.getWeatherData;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    final screenheight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Search  for City',
          style: TextStyle(color: Colors.black54),
        ),
        bottomOpacity: -4,
        backgroundColor: Color.fromARGB(255, 235, 246, 249),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromARGB(255, 235, 246, 249),
          child: Padding(
            padding: const EdgeInsets.all(13.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                        prefixIcon: IconButton(
                            onPressed: () async {}, icon: Icon(Icons.search)),
                        hintText: 'search here...',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: screenwidth * 0.46,
                  width: screenwidth,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            weather!.cityName,
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            "${weather!.temp}'C",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Row(
                            children: [
                              Flexible(
                                  child: Row(
                                children: [
                                  Icon(Icons.face_4_outlined),
                                  Text(
                                    "${weather!.feels}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              )),
                              Flexible(
                                  child: Row(
                                children: [
                                  Icon(Icons.air_outlined),
                                  Text(
                                    '${weather!.windspeed} KM/H',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () async {
                        weather = await Weather.searchLocation(
                            cityname: controller.text);

                        setState(() {});
                      },
                      child: Text('More Cities 🌨️')),
                ),
                Container(
                  height: screenheight * 0.35,
                  width: screenwidth,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  child: Row(
                    children: [
                      Expanded(
                          child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Description',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              weather!.description,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Humidity',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${weather!.humidity} %",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                        // color: Colors.amber,
                      )),
                      Divider(thickness: 23, color: Colors.black12),
                      Expanded(
                          child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Wind 🍃',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${weather!.wind}",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Presure ',
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${weather!.presure} hPa",
                              style: TextStyle(
                                  fontSize: 30, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),

                        // color: Colors.black,
                      ))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
