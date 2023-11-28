import 'package:flutter/material.dart';
import 'package:learning_curve_academy/grammar/conversion.dart';
import 'package:learning_curve_academy/grammar/fill_blanks.dart';
import 'package:learning_curve_academy/grammar/formulae.dart';

const TOPICS = ['Formulae', 'Fill in the blanks', 'Conversion'];

class GrammarDetailScreen extends StatefulWidget {
  const GrammarDetailScreen({super.key});
  @override
  State<GrammarDetailScreen> createState() => _GrammarDetailScreenState();
}

class _GrammarDetailScreenState extends State<GrammarDetailScreen> {
  int? selectedTopic = 0;

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
        title: const Text('Tenses'),
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
                          int index = entry.key;
                          String topic = entry.value;
                          return [
                            GestureDetector(
                              onTap: () => setState(() {
                                selectedTopic = index;
                              }),
                              child: Chip(
                                label: Text(topic),
                                backgroundColor: selectedTopic == index
                                    ? Color(0xFFFC7A43)
                                    : Colors.white,
                                labelStyle: TextStyle(
                                  color: selectedTopic == index
                                      ? Colors.white
                                      : Color(0xFF4A4A4A),
                                ),
                                side: BorderSide(
                                  color: selectedTopic == index
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
            if (selectedTopic == 0)
              Formulae()
            else if (selectedTopic == 1)
              FTB()
            else if (selectedTopic == 2)
              Conversion()
          ],
        ),
      ))),
    );
  }
}
