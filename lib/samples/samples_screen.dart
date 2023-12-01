import 'package:flutter/material.dart';
import 'package:learning_curve_academy/samples/sample_card.dart';
import 'package:learning_curve_academy/dataset/SAMPLES.dart';

class SampleScreen extends StatelessWidget {
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
        title: const Text('Samples'),
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
                    SAMPLES.length.toString() +
                        " Topic" +
                        (SAMPLES.length > 1 ? "s" : "") +
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
            ...SAMPLES
                .asMap()
                .map((index, e) => MapEntry(
                      index,
                      SampleCard(
                        title: e['title'],
                        index: index + 1,
                        content: e['content'],
                      ),
                    ))
                .values
                .toList(),
          ],
        ),
      ))),
    );
  }
}
