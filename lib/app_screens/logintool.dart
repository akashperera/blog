import 'package:blog/app_screens/termux.dart';
import 'package:blog/app_screens/upload_tool.dart';
import 'package:flutter/material.dart';

import '../loading_widget.dart';

class LogAdminTool extends StatefulWidget {
  @override
  _LogAdminToolState createState() => _LogAdminToolState();
}

class _LogAdminToolState extends State<LogAdminTool> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
  TextEditingController();


  bool _loading = false;

  void _validateFields() {
    if (_emailEditingController.text.isEmpty &&
        _passwordEditingController.text.isEmpty) {
      //show error  msg email pass
      _loading = false;
    } else if (_emailEditingController.text.isEmpty) {
      //show error  msg pass
      _loading = false;
    } else if (_passwordEditingController.text.isEmpty) {
      //show error  msg pass
      _loading = false;


    } else if (_emailEditingController.text == 'admin@cyberarmy.com' && _passwordEditingController.text == 'admin@termuxcontrolunit') {
      //show error  msg email
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => UploadTool()));

      _loading = true;
    } else {
      setState(() {
        _loading = false;
      });

    }

    void _moveToHomeScreen() {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => UploadTool()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                Image.asset(
                  'assets/admin.png',
                  width: 150.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextField(
                  controller: _emailEditingController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(hintText: 'Email'),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  controller: _passwordEditingController,
                  obscureText: true,
                  decoration: InputDecoration(hintText: 'Password'),
                ),
                SizedBox(
                  height: 40.0,
                ),
                _loading
                    ? circularProgress()
                    : RaisedButton(
                  color: Colors.pink,
                  child: Container(

                    width: double.infinity,
                    height: 50.0,
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                            fontSize: 18.0, color: Colors.white),
                      ),
                    ),
                  ),
                  onPressed: _validateFields,
                ),
                SizedBox(
                  height: 20.0,
                ),
                FlatButton(
                  textColor: Colors.pink,
                  child: Text(
                    "Back",
                    style: TextStyle(fontSize: 18.0),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (context) => ToolHome()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
