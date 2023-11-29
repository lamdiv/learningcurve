import 'package:flutter/material.dart';
import 'package:learning_curve_academy/lessons/unit_card.dart';

class ChapterScreen extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> units;

  const ChapterScreen(
      {Key? super.key, required this.title, required this.units});
  @override
  State<ChapterScreen> createState() => _ChapterScreenState();
}

class _ChapterScreenState extends State<ChapterScreen> {
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
        title: Text('Chapter'),
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
                    widget.title,
                    style: TextStyle(
                        color: Color.fromARGB(255, 49, 49, 49),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "(" +
                        getUnitCount().toString() +
                        ' unit' +
                        (getUnitCount() > 1 ? 's' : '') +
                        ")",
                    style: TextStyle(
                        color: Color.fromARGB(255, 119, 119, 119),
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
            SizedBox(
              height: 18,
            ),
            ...widget.units
                .asMap()
                .map((index, e) {
                  return MapEntry(
                      index,
                      UnitCard(
                        index: index + 1,
                        unit: e,
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
