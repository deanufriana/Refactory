import 'package:flutter/material.dart';
import 'package:refactory_test/containers/course/description.dart';
import 'package:refactory_test/containers/course/easy_step.dart';
import 'package:refactory_test/containers/course/header.dart';
import 'package:refactory_test/containers/course/help_skill.dart';
import 'package:refactory_test/containers/course/review.dart';
import 'package:refactory_test/widget/drawer.dart';

class Course extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'https://refactory.id/wp-content/uploads/2020/01/refactory-hd-125x52.png',
          height: 30,
        ),
      ),
      drawer: drawerWidget(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Header(),
            HelpSkill(),
            DescriptionCourse(),
            Review(),
            EasyStep()
          ],
        ),
      ),
    );
  }
}
