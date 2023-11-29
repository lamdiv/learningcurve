import 'package:flutter/material.dart';
import 'package:learning_curve_academy/lessons/chapter_card.dart';

List<Map<String, dynamic>> LESSONS = [
  {
    "id": 1,
    "title": "Chapter First",
    "units": [
      {
        "id": 1,
        "title": "A Tour to Central Zoo",
        "QnA": [
          {
            "id": 1,
            "question_text":
                "What time do the students need to arrive at school?",
            "answer_text": "The students need to arrive at school at 9:00 a.m"
          },
          {
            "id": 2,
            "question_text":
                "How long will it take them to reach the zoo from their school?",
            "answer_text":
                "It takes them 30 minutes to reach the zoo from their school."
          },
          {
            "id": 3,
            "question_text":
                "Why do you think the teacher will take the students' attendance twice?",
            "answer_text":
                "I think the teacher will take the students' attendance twice because they may be missed and left in the zoo."
          },
          {
            "id": 4,
            "question_text":
                "Why do you think the students will explore the zoo in animal groups?",
            "answer_text":
                "I think the students will explore the zoo in animal groups because they are assigned to group the animals in four different groups."
          },
          {
            "id": 5,
            "question_text":
                "Who should the students contact if they have any problem during the tour?",
            "answer_text":
                "The students should contact Mrs. Karki if they have some problems during the tour."
          }
        ],
        "MTF": [
          {"id": 1, "item": "tour", "match": " a visit to a place"},
          {"id": 2, "item": "board", "match": "to get on or into a vehicle"},
          {
            "id": 3,
            "item": "explore",
            "match": " to travel to or around an area to learn about it"
          },
          {"id": 4, "item": "grand", "match": "large and important"},
          {
            "id": 5,
            "item": "amphibian",
            "match": "any animal that can live both on land and in water"
          }
        ]
      },
      {
        "id": 1,
        "title": "A Tour to Central Zoo",
        "QnA": [
          {
            "id": 1,
            "question_text":
                "What time do the students need to arrive at school?",
            "answer_text": "The students need to arrive at school at 9:00 a.m"
          },
          {
            "id": 2,
            "question_text":
                "How long will it take them to reach the zoo from their school?",
            "answer_text":
                "It takes them 30 minutes to reach the zoo from their school."
          },
          {
            "id": 3,
            "question_text":
                "Why do you think the teacher will take the students' attendance twice?",
            "answer_text":
                "I think the teacher will take the students' attendance twice because they may be missed and left in the zoo."
          },
          {
            "id": 4,
            "question_text":
                "Why do you think the students will explore the zoo in animal groups?",
            "answer_text":
                "I think the students will explore the zoo in animal groups because they are assigned to group the animals in four different groups."
          },
          {
            "id": 5,
            "question_text":
                "Who should the students contact if they have any problem during the tour?",
            "answer_text":
                "The students should contact Mrs. Karki if they have some problems during the tour."
          }
        ],
        "MTF": [
          {"id": 1, "item": "tour", "match": "a visit to a place"},
          {"id": 2, "item": "board", "match": "to get on or into a vehicle"},
          {
            "id": 3,
            "item": "explore",
            "match": "to travel to or around an area to learn about it"
          },
          {"id": 4, "item": "grand", "match": "large and important"},
          {
            "id": 5,
            "item": "amphibian",
            "match": "any animal that can live both on land and in water"
          }
        ]
      },
    ]
  },
];

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
