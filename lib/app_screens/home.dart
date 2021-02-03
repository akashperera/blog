import 'dart:io';

import 'package:blog/app_screens/courses.dart';
import 'package:blog/app_screens/landing_screen.dart';
import 'package:blog/app_screens/modwa.dart';
import 'package:blog/app_screens/termux.dart';
import 'package:blog/app_screens/upload_course.dart';
import 'package:blog/main.dart';
import 'package:blog/models/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'drawer.dart';

class MainHome extends StatefulWidget {
  @override
  _MainHome createState() => _MainHome();
}

class _MainHome extends State<MainHome> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Center(child: Text('CYBER TECH', style: TextStyle(fontSize: 25.0),)),
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), onPressed: (){
            SystemNavigator.pop();
          }),
        ],
      ),
      drawer: MainDrawer(),
      body: Container(

        color: Colors.white,
        child: ListView(
          children: [

            Container( color: Colors.white, margin: EdgeInsets.all(10.0)),
            Container(


                color: Colors.white,
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return MyHomePage();
                      }));
                    },
                    child: Image.asset('assets/blog.png')
                )

            ),

            Container(margin: EdgeInsets.all(10.0)),
            Container(
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return ToolHome();
                      }));

                    }, child: Image.asset('assets/tools.png'))),
            Container(margin: EdgeInsets.all(10.0)),
            Container(
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return ModPage();
                      }));
                    },
                    child: Image.asset('assets/wa.png'))),
            Container(margin: EdgeInsets.all(10.0)),
            Container(
                margin: EdgeInsets.all(0.0),
                padding: EdgeInsets.all(0.0),
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                        return CourseHome();
                      }));
                    }, child: Image.asset('assets/course.png'))),
          ],
        ),
      ),
    );
  }
}
