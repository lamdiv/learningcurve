import 'package:flutter/material.dart';
import '../search_screen.dart';

class Search extends StatelessWidget {
  const Search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          "Let's find what we have got",
          style: TextStyle(
              color: Color(0xFF4A4A4A),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 18,
        ),
        SearchBar(),
      ]),
    );
  }
}

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SearchScreen()),
        );
      },
      child: Container(
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
          child: IgnorePointer(
            child: TextField(
              decoration: InputDecoration(
                hintText: "search for lessons....",
                hintStyle: TextStyle(color: Color.fromARGB(255, 176, 176, 176)),
                border: InputBorder.none, // Remove default input field border
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 217, 217,
                      217), // Change the color of the search icon
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
