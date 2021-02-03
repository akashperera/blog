import 'dart:io';

import 'package:blog/app_screens/courses.dart';
import 'package:blog/app_screens/termux.dart';
import 'package:blog/main.dart';
import 'package:blog/models/course.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

import '../loading_widget.dart';

class UploadCourse extends StatefulWidget {
  @override
  _UploadCourseState createState() => _UploadCourseState();
}

class _UploadCourseState extends State<UploadCourse> {
  final TextEditingController _descriptionEditingController =
  TextEditingController();
  final TextEditingController _methodEditingController =
  TextEditingController();

  File _imageFile;
  bool _loading = false;

  ImagePicker imagePicker = ImagePicker();

  Future<void> _chooseImage() async {
    PickedFile pickedFile = await imagePicker.getImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _imageFile = File(pickedFile.path);
    });
  }

  void _saveData(String imageUrl) {
    String date = DateTime.now().toString();


    FirebaseFirestore.instance.collection('course').add({
      'imageUrl': imageUrl,
      'description': _descriptionEditingController.text,
      'method': _methodEditingController.text,
      'date': date,

    }).whenComplete(() {
      setState(() {
        _loading = false;
      });
      //complete msg

      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return CourseHome();
      }));
    }).catchError((error) {
      setState(() {
        _loading = false;
      });

      //error msg
    });
  }

  void _uploadImage() {
    //create a unique filename form image
    String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();
    final Reference storageReferance =
    FirebaseStorage.instance.ref().child('CourseImages').child(imageFileName);
    final UploadTask uploadTask = storageReferance.putFile(_imageFile);
    uploadTask.then((TaskSnapshot taskSnapshot) {
      taskSnapshot.ref.getDownloadURL().then((imageUrl) {
        //save info to firestore
        _saveData(imageUrl);
      });
    }).catchError((error) {
//error msg
      setState(() {
        _loading = false;
      });
    });
  }

  void _validate() {
    if (_imageFile == null && _descriptionEditingController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Error',
      );
    } else if (_imageFile == null) {
      Fluttertoast.showToast(
        msg: 'Error',
      );
    } else if (_descriptionEditingController.text.isEmpty) {
      Fluttertoast.showToast(
        msg: 'Error',
      );
    } else {
      setState(() {
        _loading = true;
      });
      _uploadImage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPLOAD A COURSE'),
      ),
      body: ListView(

        children: [
          _imageFile == null
              ? Container(
            width: double.infinity,
            height: 250.0,
            color: Colors.grey,
            child: Center(
              child: RaisedButton(
                color: Colors.red,
                child: Text(
                  'Choose an Image',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                onPressed: () {
                  _chooseImage();
                },
              ),
            ),
          )
              : GestureDetector(
            onTap: () {
              _chooseImage();
            },
            child: Container(
              width: double.infinity,
              height: 250.0,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: FileImage(_imageFile),
                    fit: BoxFit.cover,
                  )),
            ),
          ),
          SizedBox(
            height: 16.0,
          ),
          TextField(
            controller: _descriptionEditingController,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                hintText: 'Description', labelText: 'Description'),
          ),
          SizedBox(
            height: 40.0,
          ),

          TextField(
            controller: _methodEditingController,
            keyboardType: TextInputType.text,
            maxLines: 10,
            decoration: InputDecoration(
                hintText: 'Course Content', labelText: 'Course Content'),
          ),
          SizedBox(
            height: 40.0,
          ),
          _loading
              ? circularProgress()
              : RaisedButton(
              color: Colors.pink,
              child: Container(
                color: Colors.pink,
                width: double.infinity,
                height: 50.0,
                child: Center(
                  child: Text(
                    'Add New Course',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ),
              onPressed: _validate),
        ],

      ),
    );
  }
}
