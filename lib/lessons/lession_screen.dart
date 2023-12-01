import 'package:flutter/material.dart';
import 'package:learning_curve_academy/lessons/chapter_card.dart';
import 'package:learning_curve_academy/dataset/LESSONS.dart';

class LessonScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1, // Add a little drop shadow
        backgroundColor: Theme.of(context)
            .scaffoldBackgroundColor, // Use the same color as main app background
        shadowColor: Colors.transparent,
        foregroundColor: Colors.black,
        titleSpacing: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Lessons'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 18,
            ),
            Text(
              LESSONS.length.toString() +
                  " Chapter" +
                  (LESSONS.length > 1 ? 's' : '') +
                  " Available",
              style: TextStyle(
                  color: Color.fromARGB(255, 49, 49, 49),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 18,
            ),
            ...LESSONS
                .asMap()
                .map((index, e) {
                  return MapEntry(
                      index,
                      ChapterCard(
                        index: index + 1,
                        title: e['title'],
                        units: e['units'],
                      ));
                })
                .values
                .toList(),
          ],
        ),
      ))),
    );
  }
}
