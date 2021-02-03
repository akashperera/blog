import 'package:blog/app_screens/login.dart';
import 'package:blog/app_screens/logintool.dart';
import 'package:blog/app_screens/upload_tool.dart';
import 'package:blog/models/tools.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../loading_widget.dart';

class ToolHome extends StatefulWidget {
  @override
  _ToolHomeState createState() => _ToolHomeState();
}

class _ToolHomeState extends State<ToolHome> {


  Widget _cardUI(Tools tools) {
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
                  tools.date,
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
              tools.description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 10.0),
            Image.network(
              tools.imageUrl,
              width: double.infinity,
              height: 150.0,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              tools.method,
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
        title: Text('TERMUX TOOLS', style: TextStyle(fontSize: 23.0),),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 2.0),
            child: IconButton(icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => LogAdminTool(),
                  ),
                );
              },
            )
          ),
        ],
      ),
      body: Container(
        color: Colors.black,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('tools').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: circularProgress(),
              );
            } else
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> toolsMap =
                  snapshot.data.docs[index].data();
                  Tools tools = Tools(
                      toolsMap['imageUrl'],
                      toolsMap['description'],
                      toolsMap['date'],
                      toolsMap['method'],
                  );
                  return _cardUI(tools);
                },
              );
          },
        ),
      ),

    );
  }
}
