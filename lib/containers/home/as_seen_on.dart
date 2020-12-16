import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../config/global.dart' as global;

class AsSeenOn extends StatefulWidget {
  AsSeenOn({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _AsSeenOnState createState() => _AsSeenOnState();
}

class _AsSeenOnState extends State<AsSeenOn> {
  @override
  void initState() {
    super.initState();
    getPartner();
  }

  Future<Map> getPartner() async {
    final url = '${global.url}seen_on.json';
    final dio = new Dio();
    final data = await dio.get(url);
    return jsonDecode(data.data);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Text(
            'As Seen On',
            style: TextStyle(
              fontSize: width * 0.07,
              fontWeight: FontWeight.bold,
            ),
          ),
          FutureBuilder(
            future: getPartner(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: snapshot.data['data'].length,
                  itemBuilder: (context, index) {
                    final data = snapshot.data['data'][index];
                    return Container(
                      height: 100,
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(
                        data['photo_url'],
                      ),
                    );
                  },
                );
              }
              return CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }
}
