import 'package:blog/app_screens/authentic_screen.dart';

import 'package:blog/app_screens/home.dart';
import 'package:blog/app_screens/landing_screen.dart';
import 'package:blog/app_screens/login.dart';

import 'package:blog/app_screens/upload_screen.dart';
import 'package:blog/app_screens/welcome.dart';
import 'package:blog/loading_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


import 'models/post.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CYBER TECH',
      theme: ThemeData(
          primaryColor: Colors.white,
          primarySwatch: Colors.blue,
          accentColor: Colors.white),
     home: Welcome(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super();

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _cardUI(Post post) {
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
                  post.date,
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
              post.description,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.black,
              ),
            ),

            SizedBox(height: 20.0),
            Image.network(
              post.imageUrl,
              width: double.infinity,
              height: 200.0,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              post.method,
              style: TextStyle(
                fontSize: 20.0,

                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10.0,
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
        title: Text("CYBER BLOGS", style: TextStyle(fontSize: 23.0),),
        actions: [
      Padding(
        padding: const EdgeInsets.only(right: 2.0),
        child: IconButton(icon: Icon(Icons.add),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return LogAdmin(

                    );
                  }));

                },

        ),
      )
          //Padding(
           // padding: const EdgeInsets.only(right: 8.0),
            //child: FlatButton(
              //  child: Text('SignOut'),
               // onPressed: () {
                //  FirebaseAuth.instance.signOut().whenComplete(() {
                  //  Navigator.of(context).pushReplacement(
                   //   MaterialPageRoute(
                     //   builder: (context) => AuthenticScreen(),
                     // ),
                   // );
                //  }).catchError((error) {
                //    Fluttertoast.showToast(
                 //     msg: error.toString(),
                 //   );
                //  });
              //  }),
        //  )
        ],
      ),
      body: Container(
        color: Colors.black,
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('posts').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: circularProgress(),
              );
            } else
              return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> postMap =
                      snapshot.data.docs[index].data();
                  Post post = Post(
                    postMap['imageUrl'],
                    postMap['description'],
                    postMap['date'],
                      postMap['method']
                  );
                  return _cardUI(post);
                },
              );
          },
        ),
      ),
    );
  }
}
