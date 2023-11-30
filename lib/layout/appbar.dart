import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Appbar extends StatefulWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  String name = '';
  String greetings = "Good Morning";

  @override
  void initState() {
    super.initState();
    __gretingText();
    _loadName();
  }

  __gretingText() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      greetings = "Good Morning";
    } else if (hour < 17) {
      greetings = "Good Afternoon";
    } else {
      greetings = "Good Evening";
    }

    setState(() {
      greetings = greetings;
    });
  }

  _loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = (prefs.getString('name') ?? '');

    if (name.isEmpty) {
      _askForName();
    } else {
      setState(() {
        name = name;
      });
    }
  }

  _askForName() async {
    await Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (BuildContext context) {
          return Scaffold(
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Enter your name',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4A4A4A)),
                    ),
                    SizedBox(height: 12),
                    Container(
                      // Set the width according to your needs
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Color.fromARGB(255, 217, 217,
                              217), // Change the border color as desired
                        ),
                        borderRadius: BorderRadius.circular(50),
                        // Adjust the border radius as needed
                      ),
                      child: SizedBox(
                        height: 45,
                        child: TextField(
                          onChanged: (value) {
                            setState(() {
                              name = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "eg: John Doe..",
                            hintStyle: TextStyle(
                                color: Color.fromARGB(255, 176, 176, 176)),
                            border: InputBorder
                                .none, // Remove default input field border
                            prefixIcon: Icon(
                              Icons.person_2_rounded,
                              color: Color.fromARGB(255, 217, 217,
                                  217), // Change the color of the search icon
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.resolveWith<Color?>(
                          (Set<MaterialState> states) {
                            return Color(
                                0xFFFC7A43); // Background color when pressed
                            // Default background color
                          },
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                50.0), // Adjust the radius as needed
                          ),
                        ),
                        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                            EdgeInsets.symmetric(vertical: 2, horizontal: 20)),
                      ),

                      onPressed: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.setString('name', name);
                        Navigator.of(context).pop();
                      },

                      child: Text(
                        'Save Name',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ), // <-- Text
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Container(
              width: 40.0,
              height: 40.0,
              decoration: BoxDecoration(
                shape: BoxShape.circle, // Create a circular shape
                border: Border.all(
                  color: Color(0xFFFFB48A), // Border color (amber)
                  width: 2.0, // Border width
                ),
              ),
              child: ClipOval(
                child: Image.network(
                  'https://cdn.pixabay.com/photo/2023/10/07/07/10/butterfly-8299620_640.jpg',
                  width: 40.0,
                  height: 40.0,
                  fit: BoxFit
                      .cover, // You can adjust the BoxFit property as needed
                ),
              ),
            ),
            Wrap(
              spacing: 4,
              direction: Axis.vertical,
              children: [
                Text(
                  greetings,
                  style: TextStyle(color: Color(0xFFA5A5A5), fontSize: 12),
                ),
                Text(
                  name,
                  style: TextStyle(
                      color: Color(0xFF4A4A4A),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
        TextButton.icon(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith<Color?>(
              (Set<MaterialState> states) {
                return Color(0xFFFC7A43); // Background color when pressed
                // Default background color
              },
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(50.0), // Adjust the radius as needed
              ),
            ),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                EdgeInsets.symmetric(vertical: 4, horizontal: 12)),
          ),

          onPressed: () {},
          icon: Icon(
            // <-- Icon
            Icons.video_camera_front_rounded,
            size: 20.0,
            color: Colors.white,
          ),
          label: Text(
            'Youtube',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ), // <-- Text
        ),
      ],
    );
  }
}
