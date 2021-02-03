

import 'package:blog/app_screens/about.dart';
import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CONTACT US'),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        color: Colors.blueAccent,
        child: Center(
          child: Column(
            children: [
              Container(
                width: 220.0,
                height: 220.0,
                margin: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      image: AssetImage('assets/mainimage.png'), fit: BoxFit.fill),
                ),
              ),

              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              FlatButton(
                child: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => About(),
                    ),
                  );
                },
              ),
              Divider(),

              SizedBox(
                height: 20.0,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Divider(),

              SizedBox(
                height: 20.0,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Divider(),

              SizedBox(
                height: 20.0,
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Divider(),

            ],
          ),
        ),
      ),

    );
  }
}
