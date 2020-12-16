import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Partner extends StatefulWidget {
  Partner({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _PartnerState createState() => _PartnerState();
}

class _PartnerState extends State<Partner> {
  @override
  void initState() {
    super.initState();
    getPartner();
  }

  Future<Map> getPartner() async {
    final url =
        'https://raw.githubusercontent.com/cahyo-refactory/RSP-DataSet-SkilTest-FE/main/partner.json';
    final dio = new Dio();
    final data = await dio.get(url);
    return jsonDecode(data.data);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'Partner Eksklusif Kami',
            style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Container(
            height: 100,
            child: FutureBuilder(
              future: getPartner(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (context, index) {
                      final data = snapshot.data['data'][index];
                      return Image.network(
                        data['photo_url'],
                        width: 130,
                        color: Colors.blue,
                        height: 100,
                      );
                    },
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          )
        ],
      ),
    );
  }
}
