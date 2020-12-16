import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff4c94b6),
        image: DecorationImage(
          image: NetworkImage(
            "https://refactory.id/wp-content/uploads/2020/01/hero-homepage.jpg",
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
            'Empowering People Through Programming',
            style: TextStyle(
              fontSize: width * 0.09,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Refactory adalah perusahaan edukasi dan teknologi yang menyediakan layanan lengkap berupa course maupun custom training yang materinya dapat disesuaikan dengan kebutuhan teknologi dan bisnis perusahaan Anda.',
            style: TextStyle(
              color: Colors.white,
              fontSize: width * 0.04,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Text(
                  'Temukan Solusi Anda',
                  style: TextStyle(
                    fontSize: width * 0.03,
                  ),
                ),
                onPressed: () {},
                color: Colors.orange,
              ),
              SizedBox(
                width: width * 0.04,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                child: Text(
                  'Tingkatkan Skill Anda',
                  style: TextStyle(
                    fontSize: width * 0.03,
                  ),
                ),
                onPressed: () {},
                color: Colors.blue,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
