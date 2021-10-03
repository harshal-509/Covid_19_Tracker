import 'package:flutter/material.dart';
class World extends StatelessWidget {
  final Map worldata;

  const World({Key key, this.worldata}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: 
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 2),
      children: <Widget>[
        Status(
            title: 'CONFIRMED',
            panelColor: Colors.red[100],
            textColor: Colors.red,
            count: worldata['cases'].toString(),
          ),
          Status(
            title: 'ACTIVE',
            panelColor: Colors.blue[100],
            textColor: Colors.blue[900],
            count: worldata['active'].toString(),
          ),
          Status(
            title: 'RECOVERED',
            panelColor: Colors.green[100],
            textColor: Colors.green,
            count: worldata['recovered'].toString(),
          ),
          Status(
            title: 'DEATHS',
            panelColor: Colors.grey[400],
            textColor: Colors.grey[900],
            count: worldata['deaths'].toString(),
          ),
      ],
      ),
    );
  }
}
class Status extends StatelessWidget {
  final Color panelColor;
  final Color textColor;
  final String title;
  final String count;

  const Status(
      {Key key, this.panelColor, this.textColor, this.title, this.count})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w=MediaQuery.of(context).size.width;
    return Container(
        margin:EdgeInsets.all(10),
        color: panelColor,
        height: 80,
        width: w/2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16, color: textColor),
          ),
          Text(
            count,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          ),
          ],
        ),    
    );
  }
}