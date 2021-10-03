import 'dart:convert';

import 'package:Covid_19_App/affected.dart';
import 'package:Covid_19_App/country.dart';
import 'package:Covid_19_App/helper.dart';
import 'package:Covid_19_App/info.dart';
import 'package:Covid_19_App/world.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<Home> {
  Map worldData;
  fetchWorldWideData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }
  List countryData;
  fetchCountryData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/countries?sort=cases');
    setState(() {
      countryData = json.decode(response.body);
    });
  }
    Future fetchData() async{
    fetchWorldWideData();
    fetchCountryData();
    print(countryData);
    print('fetchData called');
  }
  @override
   void initState() {
    fetchData();
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black87,
        title: Text("COVID-19 TRACKER"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Container(
          height: 100,
          color: Colors.cyan,
          child: Text(Help.quote,style:TextStyle(fontWeight: FontWeight.bold)),
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                  Text(
                    'WORLDWIDE',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Country()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black87,
                            borderRadius: BorderRadius.circular(15)),
                        padding: EdgeInsets.all(8),
                        child: Text(
                          'Regional',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        )),
                  ),
                ],
            ),
          ),
         worldData == null? Container():World(worldata:worldData,
                  ),
         Padding(
           padding: const EdgeInsets.all(8.0),
           child: Text('MOST AFFECTED COUNTRIES',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
         ),
        countryData == null? Container():Affected(countryData: countryData,
                  ),
                SizedBox(
              height: 20,
            ),
            Info(),
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              'WE ARE TOGETHER IN THE FIGHT',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16),
            )),
            SizedBox(
              height: 50,
            )
        ],),
      ),
    );   
  }
}