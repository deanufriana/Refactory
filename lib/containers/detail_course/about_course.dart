import 'package:flutter/widgets.dart';

class AboutCourse extends StatelessWidget {
  final String description;
  const AboutCourse({Key key, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          SizedBox(
            height: width * 0.04,
          ),
          Text(
            'Tentang Course',
            style: TextStyle(
              fontSize: width * 0.06,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: width * 0.04,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width * 0.04,
            ),
          ),
        ],
      ),
    );
  }
}
