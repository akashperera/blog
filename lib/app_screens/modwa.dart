import 'package:blog/mods/realhawa.dart';
import 'package:flutter/material.dart';

class ModPage extends StatefulWidget {
  @override
  _ModPageState createState() => _ModPageState();
}

class _ModPageState extends State<ModPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        title: Text('MOD WHATSAPP EXPERTS'),
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ListTile(
              leading: Image.asset(
                'assets/1.jpg',
                width: 70.0,
                height: 100.0,
              ),
              title: Text('Hawa Mods'),
              subtitle: Text('By Real Hawa'),
              trailing: Icon(Icons.arrow_forward_ios_rounded),
              onTap: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return HawaMain();

    }
    )
    );
              },
            ),
           // Divider(),
            //ListTile(
             // leading: Image.asset(
               // 'assets/1.jpg',
               // width: 70.0,
             //   height: 100.0,
             // ),
           //   title: Text('Introduction to Cyber Security'),
           //   subtitle: Text('Learn basics'),
           //   trailing: Icon(Icons.arrow_forward_ios_rounded),
          //    onTap: () {},
         //   ),
         //   Divider(),
         //   ListTile(
         //     leading: Image.asset(
         //       'assets/1.jpg',
          //      width: 70.0,
          //      height: 100.0,
          //    ),
         //     title: Text('Introduction to Cyber Security'),
          //    subtitle: Text('Learn basics'),
           //   trailing: Icon(Icons.arrow_forward_ios_rounded),
          //    onTap: () {},
       //     )
          ],
        ),
      ),
    );
  }
}
