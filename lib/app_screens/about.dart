
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('ABOUT US'),
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
