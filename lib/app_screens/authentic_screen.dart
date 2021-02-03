import 'package:blog/main.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../loading_widget.dart';

class AuthenticScreen extends StatefulWidget {
  @override
  _AuthenticScreenState createState() => _AuthenticScreenState();
}

class _AuthenticScreenState extends State<AuthenticScreen> {
  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordEditingController =
      TextEditingController();

  String _buttonText = 'Login';
  String _switchText = 'Dont Have an account?  Register';
  bool _loading = false;

  void _validateFields() {
    if (_emailEditingController.text.isEmpty &&
        _passwordEditingController.text.isEmpty) {
      //show error  msg email pass
      Fluttertoast.showToast(
        msg: 'Please Enter Your Email & Password',
      );
    } else if (_emailEditingController.text.isEmpty) {
      //show error  msg email
      Fluttertoast.showToast(
        msg: 'Please Enter Your Email',
      );
    } else if (_passwordEditingController.text.isEmpty) {
      //show error  msg pass
      Fluttertoast.showToast(
        msg: 'Please Enter Your Password',
      );
    } else {
      setState(() {
        _loading = true;
      });
      if (_buttonText == 'Login')
        _login();
      else
        _register();
    }
  }

  void _moveToHomeScreen() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => MyHomePage()));
  }

  void _login() {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
      email: _emailEditingController.text,
      password: _passwordEditingController.text,
    )
        .then((UserCredential userCredential) {
      //move to home
      setState(() {
        _loading = false;
      });
      Fluttertoast.showToast(
        msg: 'Login Succesfull!',
      );
      _moveToHomeScreen();
    }).catchError((error) {
      setState(() {
        _loading = false;
      });
      Fluttertoast.showToast(
        msg: error.toString(),
      );
    });
  }

  void _register() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _emailEditingController.text,
      password: _passwordEditingController.text,
    )
        .then((UserCredential userCredential) {
      //move to home
      setState(() {
        _loading = false;
      });
      Fluttertoast.showToast(
        msg: 'Please Enter Your Email & Password',
      );
      _moveToHomeScreen();
    }).catchError((error) {
      setState(() {
        _loading = false;
      });
      Fluttertoast.showToast(
        msg: error.toString(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Blog'),
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
                  'assets/images/1.jpg',
                  width: 200.0,
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
                        child: Container(
                          color: Colors.pink,
                          width: double.infinity,
                          height: 50.0,
                          child: Center(
                            child: Text(
                              _buttonText,
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
                    _switchText,
                    style: TextStyle(fontSize: 18.0),
                  ),
                  onPressed: () {
                    setState(() {
                      if (_buttonText == 'Login') {
                        _buttonText = 'Register';
                        _switchText = 'Already have an account? Login';
                      } else {
                        _buttonText = 'Login';
                        _switchText = 'Dont have an account? Register';
                      }
                    });
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
