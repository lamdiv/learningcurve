import 'package:flutter/material.dart';
import 'package:learning_curve_academy/past_questions/QuestionTapCard.dart';

const List<Map<String, dynamic>> QUESTION = [
  {
    "title": "Set 1",
    "images": [
      'assets/set1/eng1.png',
      'assets/set1/eng2.png',
      'assets/set1/eng3.png',
      'assets/set1/eng4.png',
      'assets/set1/eng5.png',
      'assets/set1/eng6.png',
    ]
  },
  {
    "title": "Set 2",
    "images": [
      'assets/set2/samp2_first.png',
      'assets/set2/samp2_sec.png',
      'assets/set2/samp2_third.png',
      'assets/set2/samp2_fourth.png',
    ]
  },
  {
    "title": "Set 3",
    "images": [
      'assets/set3/samp3_first.png',
      'assets/set3/samp3_sec.png',
      'assets/set3/samp3_third.png',
      'assets/set3/samp3_fourth.png',
    ]
  },
  {
    "title": "Set 4",
    "images": [
      'assets/set4/1.jpg',
      'assets/set4/2.jpg',
      'assets/set4/3.jpg',
    ]
  },
  {
    "title": "Set 5",
    "images": [
      'assets/set5/1.jpg',
      'assets/set5/2.jpg',
      'assets/set5/3.jpg',
    ]
  },
];

class PastQuestionListScreen extends StatelessWidget {
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
        title: const Text('Past Questions'),
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
            Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16,
                children: [
                  Text(
                    QUESTION.length.toString() +
                        " Set" +
                        (QUESTION.length > 1 ? 's' : '') +
                        " Available",
                    style: TextStyle(
                        color: Color.fromARGB(255, 49, 49, 49),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
            SizedBox(
              height: 18,
            ),
            ...QUESTION
                .asMap()
                .map((index, e) {
                  return MapEntry(
                      index,
                      QuestionTapCard(
                        index: index + 1,
                        title: e['title'],
                        images: e['images'],
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
