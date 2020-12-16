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
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          Text('MEET OUR GRADUATES'),
          SizedBox(
            height: width * 0.04,
          ),
          Text(
            'Review',
            style: TextStyle(
              fontSize: width * 0.05,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: width * 0.04,
          ),
          Text(
            'Read what our alumni said on Course Report',
            style: TextStyle(
              fontSize: width * 0.04,
            ),
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
                            SizedBox(height: width * 0.04),
                            Text(
                              data['user']['name'],
                              style: TextStyle(
                                fontSize: width * 0.04,
                              ),
                            ),
                            SizedBox(
                              height: width * 0.04,
                            ),
                            Text(
                              data['user']['from'],
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: width * 0.04,
                              ),
                            ),
                            SizedBox(height: width * 0.04),
                            StarRating(
                              value: data['star'],
                            ),
                            SizedBox(height: width * 0.04),
                            Text(
                              data['title'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.04,
                              ),
                            ),
                            SizedBox(
                              height: width * 0.04,
                            ),
                            Text(
                              data['description'],
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                fontSize: width * 0.037,
                              ),
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
