import 'package:flutter/material.dart';

class EasyStep extends StatelessWidget {
  const EasyStep({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            'Langkah Mudah',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.orange,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Memulai Belajar di Refactory Course',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.network(
              'https://i0.wp.com/refactory.id/wp-content/uploads/2020/07/Frame-3-1.png?fit=1024%2C199&ssl=1',
            ),
          )
        ],
      ),
    );
  }
}
