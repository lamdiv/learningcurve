import 'package:flutter/material.dart';
import 'package:learning_curve_academy/lessons/chapter_detail_screen.dart';
import 'package:learning_curve_academy/dataset/LESSONS.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String title = "";
  late List<Map<String, dynamic>> units;

  @override
  void initState() {
    super.initState();

    setState(() {
      units = LESSONS
          .map((element) => element['units'])
          .expand((unit) => unit)
          .map((unit) => unit as Map<String, dynamic>)
          .toList();
    });
  }

  void changeTitle(String newTitle) {
    setState(() {
      title = newTitle;
    });

    setState(() {
      units = LESSONS
          .map((element) => element['units'])
          .expand((unit) => unit)
          .map((unit) => unit as Map<String, dynamic>)
          .where((unit) =>
              unit['title'].toLowerCase().contains(title.toLowerCase()))
          .toList();
    });

    print(title);
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
        title: const Text('Search'),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SearchBar(title: title, onTitleChange: changeTitle),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 18,
                ),
                units.length > 0
                    ? Text(
                        units.length.toString() +
                            " Lesson" +
                            (units.length > 0 ? 's' : '') +
                            " Available",
                        style: TextStyle(
                            color: Color.fromARGB(255, 49, 49, 49),
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    : Container(
                        height: 500,
                        child: Center(
                          child: Text(
                            "No Lesson Found",
                            style: TextStyle(
                                color: Color.fromARGB(255, 228, 228, 228),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                SizedBox(
                  height: 18,
                ),
                ...units
                    .asMap()
                    .map((index, e) {
                      int getCourseWorkCount() {
                        dynamic count = 0;

                        count = ((e['QnA']?.length ?? 0) +
                            (e['MTF']?.length ?? 0) +
                            (e['FIB']?.length ?? 0));

                        return count;
                      }

                      return MapEntry(
                        index,
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ChapterDetailScreen(unit: e)),
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
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          e['title'],
                                          style: TextStyle(
                                            color: Color(0xFF4A4A4A),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          overflow: TextOverflow.visible,
                                        ),
                                        SizedBox(height: 8),
                                        Row(children: [
                                          Image.asset(
                                            'assets/icons/course_works.png',
                                            width:
                                                16, // Adjust the image size as needed
                                            height:
                                                16, // Adjust the image size as needed
                                            fit: BoxFit
                                                .cover, // Use 'cover' for aspect ratio
                                          ),
                                          SizedBox(width: 8),
                                          Text(
                                              getCourseWorkCount().toString() +
                                                  ' Course Work' +
                                                  (getCourseWorkCount() > 1
                                                      ? 's'
                                                      : ''),
                                              style: TextStyle(
                                                color: Color(0xFFFC7A43),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w600,
                                              )),
                                        ])
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    })
                    .values
                    .toList(),
              ],
            ),
          ],
        ),
      ))),
    );
  }
}

class SearchBar extends StatefulWidget {
  final String title;
  final Function(String) onTitleChange;

  SearchBar({Key? key, required this.title, required this.onTitleChange})
      : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
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
          onChanged: (value) {
            widget.onTitleChange(value);
          },
          decoration: InputDecoration(
            hintText: "search for lessons....",
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
