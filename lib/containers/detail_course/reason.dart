import 'package:flutter/material.dart';

class Reason extends StatelessWidget {
  final String imageUrl;
  final String question;
  final String answer;
  const Reason({
    Key key,
    this.answer,
    this.question,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl),
          SizedBox(height: width * 0.04),
          Text(
            question,
            style: TextStyle(
              fontSize: width * 0.04,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: width * 0.04),
          Text(
            answer,
            style: TextStyle(
              fontSize: width * 0.04,
            ),
          ),
        ],
      ),
    );
  }
}
