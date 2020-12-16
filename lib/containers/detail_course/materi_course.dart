import 'package:flutter/material.dart';

class CourseMateri extends StatelessWidget {
  final List materi;
  const CourseMateri({Key key, this.materi}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: width * 0.04,
          ),
          Text(
            'Materi Course',
            style: TextStyle(
              fontSize: width * 0.06,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: width * 0.04,
          ),
          ListView.builder(
            itemCount: materi.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final data = materi[index];
              return Card(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(
                        width * 0.04,
                      ),
                      alignment: Alignment.topLeft,
                      color: Colors.grey[300],
                      child: Text(
                        data['section'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.04,
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data['data'].length,
                      itemBuilder: (context, index) {
                        final detailData = data['data'][index];
                        return Container(
                          color: Colors.grey[200],
                          padding: EdgeInsets.all(width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${detailData['title']} (${detailData['time-in']})',
                              ),
                              ButtonTheme(
                                minWidth: 20.0,
                                height: 30.0,
                                child: RaisedButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Start',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
