import 'package:flutter/material.dart';

class HelpSkill extends StatelessWidget {
  const HelpSkill({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'Bagaimana Refactory Course membantu meningkatkan skill anda.',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Text(
              'Pelajari Lebih',
              style: TextStyle(fontSize: 12),
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/listcourse');
            },
            color: Colors.orange,
          ),
          SizedBox(height: 10),
          Image.network(
            'https://i0.wp.com/refactory.id/wp-content/uploads/2020/07/Frame.png?fit=839%2C481&ssl=1',
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
