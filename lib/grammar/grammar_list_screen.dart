import 'package:flutter/material.dart';
import 'package:learning_curve_academy/grammar/grammar_card.dart';

List grammarList = [
  {
    "id": 1,
    "title": "Tense",
    "course_works": 3,
    "formulae": [
      {"id": 1, "title": "Past Tense", "formula": "formula"},
    ],
    "FIB": [
      {"id": 1, "question_text": "Did you ... food?", "answer_fill": "eat"}
    ],
    "Conversion": [
      {
        "id": 1,
        "given_text": "work/he/in a department store.",
        "convert_to": "Simple Present",
        "converted_answer": "He works in a department store."
      },
      {
        "id": 2,
        "given_text": "Suman/at the weekend/do his laundry.",
        "convert_to": "Simple Present",
        "converted_answer": "Suman does his laundry at the weekend."
      },
      {
        "id": 3,
        "given_text": "my friends and I/once a month/go to the cinema.",
        "convert_to": "Simple Present",
        "converted_answer": "My friends and I go to the cinema once a month."
      },
      {
        "id": 4,
        "given_text": "give/nice gift/a/me/my neighbour/never.",
        "convert_to": "Simple Present",
        "converted_answer": "My neighbour never gives me a nice gift."
      },
      {
        "id": 5,
        "given_text": "playing/always/love/the guitar/Akash.",
        "convert_to": "Simple Present",
        "converted_answer": "Akash always loves playing the guitar."
      },
      {
        "id": 6,
        "given_text": "a doctor/mother/be/my.",
        "convert_to": "Simple Present",
        "converted_answer": "My mother is a doctor."
      },
      {
        "id": 7,
        "given_text": "drive/she/always/too fast/her scooter.",
        "convert_to": "Simple Present",
        "converted_answer": "She always drives her scooter too fast."
      },
      {
        "id": 8,
        "given_text": "the day/a lot of/work/people/during.",
        "convert_to": "Simple Present",
        "converted_answer": "During the day, a lot of people work."
      },
      {
        "id": 9,
        "given_text": "where/your brother/work?",
        "convert_to": "Simple Present",
        "converted_answer": "Where does your brother work?"
      },
      {
        "id": 10,
        "given_text": "what time/your sister/every day/get up?",
        "convert_to": "Simple Present",
        "converted_answer": "What time does your sister get up every day?"
      }
    ]
  }
];

class GrammarListScreen extends StatelessWidget {
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
        title: const Text('Grammar'),
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
                    grammarList.length.toString() +
                        " Topic" +
                        (grammarList.length > 1 ? 's' : '') +
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
            ...grammarList
                .asMap()
                .map((index, e) {
                  return MapEntry(
                      index,
                      GrammarCard(
                          index: index + 1, title: e['title'], topics: e));
                })
                .values
                .toList()
          ],
        ),
      ))),
    );
  }
}
