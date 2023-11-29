import 'package:flutter/material.dart';
import 'package:learning_curve_academy/lessons/chapter_screen.dart';

class ChapterCard extends StatefulWidget {
  final String title;
  final int index;
  final List<Map<String, dynamic>> units;

  const ChapterCard({
    super.key,
    required this.title,
    required this.index,
    required this.units,
  });

  @override
  State<ChapterCard> createState() => _ChapterCardState();
}

class _ChapterCardState extends State<ChapterCard> {
  int getUnitCount() {
    return widget.units.length;
  }

  int getCourseWorkCount() {
    dynamic count = 0;
    widget.units.forEach((unit) {
      count += ((unit['QnA']?.length ?? 0) +
          (unit['MTF']?.length ?? 0) +
          (unit['FIB']?.length ?? 0));
    });
    return count;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
              builder: (context) => ChapterScreen(
                    title: widget.title,
                    units: widget.units,
                  )),
        );
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
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.visible,
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Row(children: [
                          Image.asset(
                            'assets/icons/units.png',
                            width: 16, // Adjust the image size as needed
                            height: 16, // Adjust the image size as needed
                            fit: BoxFit.cover, // Use 'cover' for aspect ratio
                          ),
                          SizedBox(width: 8),
                          Text(
                              widget.units.length.toString() +
                                  ' Unit' +
                                  (widget.units.length > 1 ? 's' : ''),
                              style: TextStyle(
                                color: Color(0xFFFC7A43),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              )),
                        ]),
                        SizedBox(width: 20),
                        Row(children: [
                          Image.asset(
                            'assets/icons/course_works.png',
                            width: 16, // Adjust the image size as needed
                            height: 16, // Adjust the image size as needed
                            fit: BoxFit.cover, // Use 'cover' for aspect ratio
                          ),
                          SizedBox(width: 8),
                          Text(
                              getCourseWorkCount().toString() +
                                  ' Course Work' +
                                  (getCourseWorkCount() > 1 ? 's' : ''),
                              style: TextStyle(
                                color: Color(0xFFFC7A43),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              )),
                        ]),
                      ],
                    )
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
