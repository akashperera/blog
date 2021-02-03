import 'package:flutter/material.dart';


class HawaMain extends StatefulWidget {
  @override
  _HawaMainState createState() => _HawaMainState();
}

class _HawaMainState extends State<HawaMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real Hawa Mods '),
      ),
      body: Center(
        child: Text('Coming soon ..', style: TextStyle(fontSize: 50.0),),
      ),
    );
  }
}
