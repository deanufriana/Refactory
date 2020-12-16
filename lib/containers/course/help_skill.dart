import 'package:flutter/material.dart';

class HelpSkill extends StatelessWidget {
  const HelpSkill({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'Bagaimana Refactory Course membantu meningkatkan skill anda.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width * 0.06,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: width * 0.04,
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Text(
              'Pelajari Lebih',
              style: TextStyle(
                fontSize: width * 0.04,
              ),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/listcourse');
            },
            color: Colors.orange,
          ),
          SizedBox(height: width * 0.04),
          Image.network(
            'https://i0.wp.com/refactory.id/wp-content/uploads/2020/07/Frame.png?fit=839%2C481&ssl=1',
          ),
          SizedBox(height: width * 0.04),
        ],
      ),
    );
  }
}
