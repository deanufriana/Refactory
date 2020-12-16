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
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl),
          SizedBox(height: 10),
          Text(
            question,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          Text(answer),
        ],
      ),
    );
  }
}
