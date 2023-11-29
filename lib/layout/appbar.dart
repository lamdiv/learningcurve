import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Appbar extends StatefulWidget {
  const Appbar({Key? key}) : super(key: key);

  @override
  _AppbarState createState() => _AppbarState();
}

class _AppbarState extends State<Appbar> {
  String name = 'Diwash Lamichhane';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadName();
    });
  }

  _loadName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = (prefs.getString('name') ?? 'Diwash Lamichhane');
    if (name.isEmpty) {
      _askForName();
    }
  }

  _askForName() async {
    await showDialog<String>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter your name'),
          content: TextField(
            onChanged: (value) {
              name = value;
            },
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('name', name);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
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
                  'Good Morning',
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
