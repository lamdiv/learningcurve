import 'package:flutter/material.dart';

class PastQuestionDetailScreen extends StatefulWidget {
  final String title;
  final List<String> images;

  PastQuestionDetailScreen(
      {Key? key, required this.title, required this.images})
      : super(key: key);

  @override
  State<PastQuestionDetailScreen> createState() =>
      _PastQuestionDetailScreenState();
}

class _PastQuestionDetailScreenState extends State<PastQuestionDetailScreen> {
  @override
  void initState() {
    super.initState();

    if (widget.images.length > 1) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            backgroundColor: Color(0xFFFC7A43),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Swipe to view more images",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ],
            ),
            duration: Duration(seconds: 3),
          ),
        );
      });
    }
    ;
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
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: PageView.builder(
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return InteractiveViewer(
                child: Image.asset(
                  widget.images[index],
                  fit: BoxFit.fitWidth,
                ),
              );
            },
          ),
        ));
  }
}
