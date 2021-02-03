import 'package:blog/app_screens/login.dart';
import 'package:blog/app_screens/upload_course.dart';
import 'package:blog/models/course.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../loading_widget.dart';

class CourseHome extends StatefulWidget {
  @override
  _CourseHomeState createState() => _CourseHomeState();
}

class _CourseHomeState extends State<CourseHome> {


  Widget _cardUI(Course course) {
    return Card(
      margin: EdgeInsets.all(16.0),
      elevation: 10.0,
      child: Container(
        padding: EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  course.date,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],

            ),

            Text(
              course.description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 10.0),
            Image.network(
              course.imageUrl,
              width: double.infinity,
              height: 100.0,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              course.method,
              style: TextStyle(
                fontSize: 20.0,

                color: Colors.black,
              ),
            ),


          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text(' FREE COURSES', style: TextStyle(fontSize: 23.0),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: FlatButton(
              child: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => UploadCourse(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('course').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: circularProgress(),
              );
            } else
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> courseMap =
                  snapshot.data.docs[index].data();
                  Course course = Course(
                    courseMap['imageUrl'],
                    courseMap['description'],
                    courseMap['date'],
                    courseMap['method'],
                  );
                  return _cardUI(course);
                },
              );
          },
        ),
      ),

    );
  }
}
