import 'package:flutter/material.dart';
import 'package:learning_curve_academy/grammar/conversion.dart';
import 'package:learning_curve_academy/grammar/fill_blanks.dart';
import 'package:learning_curve_academy/grammar/formulae.dart';

String topicsToString(topic) {
  switch (topic) {
    case 'formulae':
      return 'Structures';
    case 'FIB':
      return 'Fill in the blanks';
    case 'Conversion':
      return 'Conversion';
    default:
      return '';
  }
}

// const TOPICS = ['Formulae', 'Fill in the blanks', 'Conversion'];

class GrammarDetailScreen extends StatefulWidget {
  final Map<String, dynamic> topics;
  final String title;

  const GrammarDetailScreen(
      {Key? super.key, required this.topics, required this.title});
  @override
  State<GrammarDetailScreen> createState() => _GrammarDetailScreenState();
}

class _GrammarDetailScreenState extends State<GrammarDetailScreen> {
  String? selectedTopic = 'Conversion';

  List<String> TOPICS = [];

  @override
  void initState() {
    super.initState();

    if (widget.topics.containsKey('formulae') &&
        widget.topics['formulae'].length > 0) {
      TOPICS.add('formulae');
    }

    if (widget.topics.containsKey('FIB') && widget.topics['FIB'].length > 0) {
      TOPICS.add('FIB');
    }

    if (widget.topics.containsKey('Conversion') &&
        widget.topics['Conversion'].length > 0) {
      TOPICS.add('Conversion');
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
        title: Text(widget.title),
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
            if (selectedTopic == 'formulae')
              Formulae(
                questions: widget.topics['formulae'] ?? [],
              )
            else if (selectedTopic == 'FIB')
              FTB(questions: widget.topics['FIB'] ?? [])
            else if (selectedTopic == 'Conversion')
              Conversion(questions: widget.topics['Conversion'] ?? [])
          ],
        ),
      ))),
    );
  }
}
