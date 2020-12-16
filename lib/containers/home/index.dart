import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:refactory_test/containers/home/description.dart';
import 'package:refactory_test/containers/home/header.dart';
import 'package:refactory_test/containers/home/partner.dart';
import 'package:refactory_test/containers/home/as_seen_on.dart';
import 'package:refactory_test/widget/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      final userLogin = jsonDecode(prefs.getString('userLogin'));
      final key = 'loginCount_${userLogin['email']}_${userLogin['password']}';
      final count = prefs.getInt(key).toString();
      final snackbar = SnackBar(
        content: Text(
          'anda telah login menggunakan ${userLogin['username']} : ${userLogin['email']} sebanyak $count kali',
        ),
      );
      _scaffoldKey.currentState.showSnackBar(snackbar);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Image.network(
          'https://refactory.id/wp-content/uploads/2020/01/refactory-hd-125x52.png',
          height: 30,
        ),
      ),
      drawer: drawerWidget(context),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Header(),
            SizedBox(height: 10),
            Partner(),
            SizedBox(height: 10),
            Description(),
            SizedBox(height: 20),
            AsSeenOn()
          ],
        ),
      ),
    );
  }
}
