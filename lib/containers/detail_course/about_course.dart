import 'package:flutter/widgets.dart';

class AboutCourse extends StatelessWidget {
  final String description;
  const AboutCourse({Key key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Tentang Course',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            description,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
