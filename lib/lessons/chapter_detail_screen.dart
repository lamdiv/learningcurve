import 'package:flutter/material.dart';
import 'package:learning_curve_academy/lessons/match_the_following.dart';
import 'package:learning_curve_academy/lessons/questions_answers.dart';
import 'package:learning_curve_academy/lessons/true_or_false.dart';

String topicsToString(topic) {
  switch (topic) {
    case 'QnA':
      return 'Questions & Answers';
    case 'MTF':
      return 'Match the following';
    default:
      return '';
  }
}

class ChapterDetailScreen extends StatefulWidget {
  final Map<String, dynamic> unit;

  const ChapterDetailScreen({Key? super.key, required this.unit});
  @override
  State<ChapterDetailScreen> createState() => _ChapterDetailScreenState();
}

class _ChapterDetailScreenState extends State<ChapterDetailScreen> {
  String? selectedTopic = 'QnA';

  List<String> TOPICS = [];

  @override
  void initState() {
    super.initState();
    if (widget.unit['QnA']?.length > 0) {
      TOPICS.add('QnA');
    }
    if (widget.unit['MTF']?.length > 0) {
      TOPICS.add('MTF');
    }
  }

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
        title: Text(widget.unit['title'] ?? ''),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select a Topic",
                  style: TextStyle(
                      color: Color.fromARGB(255, 49, 49, 49),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: TOPICS
                        .asMap()
                        .entries
                        .map((entry) {
                          String topic = entry.value;
                          return [
                            GestureDetector(
                              onTap: () => setState(() {
                                selectedTopic = topic;
                              }),
                              child: Chip(
                                shape: StadiumBorder(),
                                label: Text(topicsToString(topic)),
                                backgroundColor: selectedTopic == topic
                                    ? Color(0xFFFC7A43)
                                    : Colors.white,
                                labelStyle: TextStyle(
                                  color: selectedTopic == topic
                                      ? Colors.white
                                      : Color(0xFF4A4A4A),
                                ),
                                side: BorderSide(
                                  color: selectedTopic == topic
                                      ? Color(0xFFFC7A43)
                                      : Color(0xFF4A4A4A),
                                  width: 1,
                                ),
                              ),
                            ),

                            SizedBox(width: 10), // Adjust the width as needed
                          ];
                        })
                        .expand((x) => x)
                        .toList(),

                    // Add more chips here
                  ),
                ),
              ],
            ),
            Divider(
              color: Colors.grey,
              height: 30,
            ),
            if (selectedTopic == 'QnA')
              QnA(
                questions: widget.unit['QnA'] ?? [],
              )
            else if (selectedTopic == 'MTF')
              MTF(questions: widget.unit['MTF'] ?? [])
            else if (selectedTopic == 'TOF')
              TOF()
          ],
        ),
      ))),
    );
  }
}
