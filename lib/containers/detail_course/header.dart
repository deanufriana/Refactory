import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final int id;
  final String urlImage;
  final String title;
  final String subtitle;
  const Header({
    Key key,
    this.urlImage,
    this.title,
    this.subtitle,
    this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff4c94b6),
        image: DecorationImage(
          image: NetworkImage(
            urlImage,
          ),
          colorFilter: new ColorFilter.mode(
            Colors.blue.withOpacity(0.2),
            BlendMode.dstATop,
          ),
          fit: BoxFit.cover,
        ),
      ),
      height: MediaQuery.of(context).size.height - 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width * 0.07,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: width * 0.04),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.04,
            ),
          ),
          SizedBox(height: width * 0.04),
          RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Text(
              'Mulai Belajar',
              style: TextStyle(fontSize: width * 0.04),
            ),
            onPressed: () {},
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
