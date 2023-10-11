import 'package:flutter/material.dart';

class Appbar extends StatelessWidget {
  const Appbar({
    super.key,
  });

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
                  'Diwash Lamichhane',
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
                EdgeInsets.symmetric(vertical: 4, horizontal: 14)),
          ),

          onPressed: () {},
          icon: Icon(
            // <-- Icon
            Icons.video_camera_front_rounded,
            size: 16.0,
            color: Colors.white,
          ),
          label: Text(
            'Follow Us',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ), // <-- Text
        ),
      ],
    );
  }
}
