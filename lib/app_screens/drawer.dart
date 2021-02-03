

import 'package:blog/app_screens/about.dart';
import 'package:blog/app_screens/contact.dart';
import 'package:blog/app_screens/termux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              color: Theme.of(context).primaryColor,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      width: 150.0,
                      height: 150.0,
                      margin: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                            image: AssetImage('assets/mainimage.png'), fit: BoxFit.fill),
                      ),
                    ),
                  ],
                ),
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
            ListTile(
            //  leading: Icon(Icons.info),
            //  title: Text(
             //   'About Us',
             //   style: TextStyle(fontSize: 20.0),
           //   ),
            //  onTap: () {
            //    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            //      return About();
            //    }));
          //    },
         //   ),
         //   Divider(),
         //   ListTile(
          //    leading: Icon(Icons.contact_support),
          //    title: Text(
            //    'Contact Us',
            //    style: TextStyle(fontSize: 20.0),
            //  ),
           //   onTap: () {
           //     Navigator.of(context).push(MaterialPageRoute(builder: (_) {
           //       return Contact();
           //     }));
           //   },
            ),
            ListTile(
              title: Text(
                ' ',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            ListTile(
              title: Align(
                alignment: Alignment.bottomCenter,
                child: Center(
                  child: Text(
                    'Version 1.0.0',
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
