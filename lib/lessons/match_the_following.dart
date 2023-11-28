import 'package:flutter/material.dart';

class MTF extends StatelessWidget {
  const MTF({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Match the following:",
          style: TextStyle(
              color: Color.fromARGB(255, 49, 49, 49),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 5,
        ),
        Text(
          "Note: Answers are already matched",
          style: TextStyle(
              color: Colors.grey[500],
              fontSize: 12,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/checkmark.png',
                                  width: 16, // Adjust the image size as needed
                                  height: 16, // Adjust the image size as needed
                                  fit: BoxFit
                                      .cover, // Use 'cover' for aspect ratio
                                ),
                                SizedBox(width: 14),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Tour',
                                          style: TextStyle(
                                            color:
                                                Color.fromARGB(255, 49, 49, 49),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      Image.asset(
                                        'assets/icons/dualarrow.png',
                                        width: 40,
                                        // Adjust the image size as needed
                                      ),
                                      Text('Tour',
                                          style: TextStyle(
                                            color: Color.fromARGB(
                                                255, 119, 119, 119),
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ],
                                  ),
                                )
                              ])
                        ],
                      ),
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
    );
  }
}
