import 'package:flutter/material.dart';

class Conversion extends StatefulWidget {
  final List<Map<String, dynamic>> questions;
  const Conversion({super.key, required this.questions});

  @override
  State<Conversion> createState() => _ConversionState();
}

class _ConversionState extends State<Conversion> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Convert accordingly.",
          style: TextStyle(
              color: Color.fromARGB(255, 49, 49, 49),
              fontSize: 16,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        ...widget.questions
            .asMap()
            .map((index, e) => MapEntry(
                  index,
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          (index + 1).toString() + ".",
                                          style: TextStyle(
                                            color: Color(0xFF4A4A4A),
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Expanded(
                                          child: Text(
                                            e['given_text'],
                                            style: TextStyle(
                                              color: Color(0xFF4A4A4A),
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            overflow: TextOverflow.visible,
                                          ),
                                        ),
                                        SizedBox(width: 12),
                                        Text(
                                          e['convert_to'],
                                          style: TextStyle(
                                            color: Colors.grey[500],
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 8),
                                    Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/icons/checkmark.png',
                                            width:
                                                16, // Adjust the image size as needed
                                            height:
                                                16, // Adjust the image size as needed
                                            fit: BoxFit
                                                .cover, // Use 'cover' for aspect ratio
                                          ),
                                          SizedBox(width: 12),
                                          Expanded(
                                            child: Text(e['converted_answer'],
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 119, 119, 119),
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ),
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
                ))
            .values
            .toList()
      ],
    );
  }
}
