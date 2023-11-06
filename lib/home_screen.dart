import 'package:flutter/material.dart';
import 'layout/appbar.dart';
import 'layout/cover.dart';
import 'layout/section.dart';
import 'layout/search_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Appbar(),
                  Cover(),
                  Sections(),
                  Search(),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Our Lessons",
                            style: TextStyle(
                                color: Color(0xFF4A4A4A),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 18,
                          ),
                          GridView.builder(
                            shrinkWrap: true, // Allows the GridView to scroll
                            physics:
                                NeverScrollableScrollPhysics(), // Disable GridView's internal scrolling
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2, // 2 cards per row
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 10,
                                    childAspectRatio: 1.1),
                            itemCount: 6, // Number of cards you want to display
                            itemBuilder: (BuildContext context, int index) {
                              return MyCard();
                            },
                          ),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

class MyCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      shadowColor: Color(0xFFD6D6D6).withOpacity(0.3),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/icons/bookshelf.png',
                    width: 30,
                    height: 30,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Preposition',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Grammar',
                    style: TextStyle(
                      color: Color(0xFFFC7A43),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
