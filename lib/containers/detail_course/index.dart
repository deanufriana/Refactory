import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:refactory_test/config/global.dart' as global;
import 'package:refactory_test/containers/detail_course/header.dart';
import 'package:refactory_test/containers/detail_course/about_course.dart';
import 'package:refactory_test/containers/detail_course/materi_course.dart';
import 'package:refactory_test/containers/detail_course/reason.dart';

class DetailCourse extends StatelessWidget {
  final int id;
  final String title;
  final String subtitle;
  final String urlImage;
  const DetailCourse({
    Key key,
    this.id,
    this.title,
    this.subtitle,
    this.urlImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> getDetail() async {
      final dio = new Dio();
      final response = await dio.get('${global.url}detail-course.json');

      return jsonDecode(response.data);
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'https://refactory.id/wp-content/uploads/2020/01/refactory-hd-125x52.png',
          height: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: FutureBuilder(
            future: getDetail(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final data = snapshot.data;
                return Column(
                  children: [
                    Header(
                      id: id,
                      title: title,
                      subtitle: subtitle,
                      urlImage: urlImage,
                    ),
                    AboutCourse(
                      description: data['short-description'],
                    ),
                    CourseMateri(
                      materi: data['materi course'],
                    ),
                    Reason(
                      answer: data['answer'],
                      question: data['quistion'],
                      imageUrl: data['quistion-photo'],
                    )
                  ],
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
