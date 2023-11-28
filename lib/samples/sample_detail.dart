import 'package:flutter/material.dart';

class SampleDetailScreen extends StatelessWidget {
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
        title: const Text('Essays'),
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
              padding: const EdgeInsets.only(left: 24),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "The Jungle Book",
                      style: TextStyle(
                          color: Color(0xFFFC7A43),
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "(500 words)",
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
                width: 16, // Adjust the image size as needed
                height: 16, // Adjust the image size as needed
                fit: BoxFit.cover, // Use 'cover' for aspect ratio
              ),
              SizedBox(width: 12),
              Expanded(
                child: Text('Ernest Hemingway killed the Mockingbird killed.',
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
