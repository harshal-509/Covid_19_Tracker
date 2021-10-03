import 'package:flutter/material.dart';
import 'helper.dart';
class FAQ extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text('FAQs'),
      ),
      body: ListView.builder(
          itemCount: Help.questionAnswers.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(
                Help.questionAnswers[index]['question'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(Help.questionAnswers[index]['answer']),
                )
              ],
            );
          }),
    );
  }
}