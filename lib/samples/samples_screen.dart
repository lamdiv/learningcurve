import 'package:flutter/material.dart';
import 'package:learning_curve_academy/samples/essay_list_screen.dart';

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
                    "2 Topics Available",
                    style: TextStyle(
                        color: Color.fromARGB(255, 49, 49, 49),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ]),
            SizedBox(
              height: 18,
            ),
            GestureDetector(
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EssayListScreen()),
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
                              '01',
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
                              'Essays',
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
                                    width:
                                        16, // Adjust the image size as needed
                                    height:
                                        16, // Adjust the image size as needed
                                    fit: BoxFit
                                        .cover, // Use 'cover' for aspect ratio
                                  ),
                                  SizedBox(width: 8),
                                  Text(2.toString() + ' Essays Available',
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
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EssayListScreen()),
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
                              '02',
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
                              'Book Review',
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
                                    width:
                                        16, // Adjust the image size as needed
                                    height:
                                        16, // Adjust the image size as needed
                                    fit: BoxFit
                                        .cover, // Use 'cover' for aspect ratio
                                  ),
                                  SizedBox(width: 8),
                                  Text(2.toString() + ' Essays Available',
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
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ))),
    );
  }
}
