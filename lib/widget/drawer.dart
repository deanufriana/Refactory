import 'package:flutter/material.dart';

Widget drawerWidget(BuildContext context) {
  goToHome() {
    Navigator.of(context).pushReplacementNamed('/home');
  }

  goToCourse() {
    Navigator.of(context).pushReplacementNamed('/course');
  }

  return Drawer(
    elevation: 10,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Refactory',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text('Home'),
          onTap: goToHome,
        ),
        ListTile(
          leading: Icon(Icons.book),
          title: Text('Course'),
          onTap: goToCourse,
        ),
      ],
    ),
  );
}
