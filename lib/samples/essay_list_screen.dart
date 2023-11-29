import 'package:flutter/material.dart';
import 'package:learning_curve_academy/samples/sample_detail.dart';

class EssayListScreen extends StatefulWidget {
  final String title;
  final List<Map<String, dynamic>> content;

  const EssayListScreen({
    Key? key,
    required this.title,
    required this.content,
  });

  @override
  State<EssayListScreen> createState() => _EssayListScreenState();
}

class _EssayListScreenState extends State<EssayListScreen> {
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
            Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16,
                children: [
                  Text(
                    widget.content.length.toString() +
                        " Essay" +
                        (widget.content.length > 1 ? "s" : "") +
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
            ...widget.content
                .asMap()
                .map((index, e) => MapEntry(
                    index,
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (context) => SampleDetailScreen(
                                  title: widget.title, content: e)),
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
                                      (index + 1).toString(),
                                      style: TextStyle(
                                        color: Color(0xFFFC7A43),
                                        fontSize: 20,
                                        fontWeight: FontWeight.w800,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Expanded(
                                  child: Text(
                                    e['topic'],
                                    style: TextStyle(
                                      color: Color(0xFF4A4A4A),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow.visible,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )))
                .values
                .toList()
          ],
        ),
      ))),
    );
  }
}
