import 'package:flutter/material.dart';
import 'package:learning_curve_academy/past_questions/question_screen.dart';

class QuestionTapCard extends StatefulWidget {
  final int index;
  final String title;
  final List<String> images;
  const QuestionTapCard(
      {Key? super.key,
      required this.title,
      required this.images,
      required this.index});

  @override
  State<QuestionTapCard> createState() => _QuestionTapCardState();
}

class _QuestionTapCardState extends State<QuestionTapCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => PastQuestionDetailScreen(
                    title: widget.title,
                    images: widget.images,
                  )),
        )
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        shadowColor: Color(0xFFD6D6D6).withOpacity(0.3),
        elevation: 3,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 60, // Adjust the size as needed
                  height: 60,
                  // Adjust the size as needed
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFC7A43).withOpacity(0.15),
                    // Background color of the circle
                  ),
                  child: Center(
                    child: Text(
                      widget.index.toString(),
                      style: TextStyle(
                        color: Color(0xFFFC7A43),
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(
                        color: Color(0xFF4A4A4A),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.visible,
                    ),
                    SizedBox(height: 8),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
