import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:refactory_test/config/global.dart' as global;
import 'package:refactory_test/containers/detail_course/index.dart';

class ListCourse extends StatelessWidget {
  const ListCourse({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> getListCourse() async {
      final dio = new Dio();
      final response = await dio.get('${global.url}/list-course.json');

      return jsonDecode(response.data);
    }

    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'https://refactory.id/wp-content/uploads/2020/01/refactory-hd-125x52.png',
          height: 30,
        ),
      ),
      body: Container(
        child: FutureBuilder(
          future: getListCourse(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final listCourse = snapshot.data['data'];
              return ListView.builder(
                itemCount: listCourse.length,
                itemBuilder: (context, index) {
                  Map data = listCourse[index];
                  if (data.containsKey('id')) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return DetailCourse(
                                id: index,
                                title: data['title'],
                                subtitle: data['short_description'],
                                urlImage: data['photo_url'],
                              );
                            },
                          ),
                        );
                      },
                      child: Card(
                        child: Container(
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                data['photo_url'],
                              ),
                              SizedBox(height: 10),
                              Text(
                                data['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(data['short_description']),
                              ListTile(
                                leading:
                                    Image.network(data['user']['photo_url']),
                                title: new Text(
                                  data['user']['name'],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                  return SizedBox();
                },
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
