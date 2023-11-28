import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
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
        title: const Text('Search'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SearchBar(),
            Container(
              height: 500,
              child: Center(
                child: Text(
                  "No Course Found",
                  style: TextStyle(
                      color: Color.fromARGB(255, 228, 228, 228),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ))),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, // Set the width according to your needs
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromARGB(
              255, 217, 217, 217), // Change the border color as desired
        ),
        borderRadius: BorderRadius.circular(50),
        // Adjust the border radius as needed
      ),
      child: SizedBox(
        height: 45,
        child: TextField(
          decoration: InputDecoration(
            hintText: "search for courses, videos....",
            hintStyle: TextStyle(color: Color.fromARGB(255, 176, 176, 176)),
            border: InputBorder.none, // Remove default input field border
            prefixIcon: Icon(
              Icons.search,
              color: Color.fromARGB(
                  255, 217, 217, 217), // Change the color of the search icon
            ),
          ),
        ),
      ),
    );
  }
}
