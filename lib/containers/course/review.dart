import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:refactory_test/widget/star_review.dart';
import '../../config/global.dart' as global;

class Review extends StatefulWidget {
  Review({Key key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  Future<void> getReview() async {
    final dio = new Dio();

    final response = await dio.get('${global.url}alumni-report.json');

    return jsonDecode(response.data);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text('MEET OUR GRADUATES'),
          SizedBox(height: 10),
          Text(
            'Review',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Read what our alumni said on Course Report',
          ),
          FutureBuilder(
            future: getReview(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final listData = snapshot.data['data'];
                return ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: listData.length,
                  itemBuilder: (context, index) {
                    final data = listData[index];
                    return Card(
                      margin: EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(data['user']['photo_url']),
                            SizedBox(height: 10),
                            Text(
                              data['user']['name'],
                            ),
                            SizedBox(height: 10),
                            Text(
                              data['user']['from'],
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: 10),
                            StarRating(
                              value: data['star'],
                            ),
                            SizedBox(height: 10),
                            Text(
                              data['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              data['description'],
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }

              return CircularProgressIndicator();
            },
          ),
        ],
      ),
    );
  }
}
