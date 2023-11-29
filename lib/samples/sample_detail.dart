import 'package:flutter/material.dart';

class SampleDetailScreen extends StatefulWidget {
  final String title;
  final Map<String, dynamic> content;

  const SampleDetailScreen(
      {Key? key, required this.title, required this.content})
      : super(key: key);

  @override
  State<SampleDetailScreen> createState() => _SampleDetailScreenState();
}

class _SampleDetailScreenState extends State<SampleDetailScreen> {
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
            Padding(
              padding: const EdgeInsets.only(left: 14),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.content['topic'],
                        style: TextStyle(
                            color: Color.fromRGBO(252, 122, 67, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      "(" +
                          (widget.content['description'].split(" ").length)
                              .toString() +
                          " words)",
                      style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
            ),
            SizedBox(
              height: 12,
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Image.asset(
                'assets/icons/arrow.png',
                width: 10, // Adjust the image size as needed
                height: 16, // Adjust the image size as needed
                fit: BoxFit.cover, // Use 'cover' for aspect ratio
              ),
              SizedBox(width: 6),
              Expanded(
                child: Text(widget.content['description'],
                    style: TextStyle(
                      height: 1.3,
                      color: Color.fromARGB(255, 119, 119, 119),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    )),
              ),
            ])
          ],
        ),
      ))),
    );
  }
}
