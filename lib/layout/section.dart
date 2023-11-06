import 'package:flutter/material.dart';
import 'package:learning_curve_academy/grammar/grammar_list_screen.dart';
import 'package:learning_curve_academy/lessons/lession_screen.dart';
import 'package:learning_curve_academy/past_questions/past_question_list.dart';
import 'package:learning_curve_academy/samples/samples_screen.dart';


class Sections extends StatelessWidget {
  const Sections({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularImageItem(
            redirectScreen: LessonScreen(),
            imageUrl: 'assets/icons/bookshelf.png',
            bgColor: 0xFFFC7A43,
            name: 'Lessons',
          ),

          CircularImageItem(
            redirectScreen: GrammarListScreen(),
            imageUrl: 'assets/icons/cube.png',
            bgColor: 0xFF43FCFC,
            name: 'Grammar',
          ),
          CircularImageItem(
            redirectScreen: SampleScreen(),
            imageUrl: 'assets/icons/sample.png',
            bgColor: 0xFFB543FC,
            name: 'Samples',
          ),
          CircularImageItem(
            redirectScreen: PastQuestionListScreen(),
            imageUrl: 'assets/icons/pastquestion.png',
            bgColor: 0xFFFFB400,
            name: 'Past Questions',
          ),
        ],
      ),
    );
  }
}

class CircularImageItem extends StatelessWidget {
  final String imageUrl;
  final String name;
  final int bgColor;
  final  redirectScreen;

  const CircularImageItem(
      {super.key,
      required this.imageUrl,
      required this.name,
      this.redirectScreen,
      required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => redirectScreen),
        );
      },
      child: Column(
        children: [
          Container(
            width: 60, // Adjust the size as needed
            height: 60,
            // Adjust the size as needed
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Color(bgColor).withOpacity(0.15),
              // Background color of the circle
            ),
            child: Center(
              child: ClipRRect(
                child: Image.asset(
                  imageUrl,
                  width: 30, // Adjust the image size as needed
                  height: 30, // Adjust the image size as needed
                  fit: BoxFit.cover, // Use 'cover' for aspect ratio
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: Color(0xFF4A4A4A)),
          ),
        ],
      ),
    );
  }
}
