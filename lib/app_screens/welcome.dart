import 'package:blog/app_screens/home.dart';
import 'package:flutter/material.dart';


class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(

        children: [
          Expanded(
            flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/mainimage.png'),
                  )

                ),
              )
          ),
          Expanded(
              child: Column(
children: [
  RichText(
      text: TextSpan(
        text: "WELCOME",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
        )
          ),

  ),
 SizedBox(height: 30,),
  GestureDetector(
    onTap: ()
    {
      Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return MainHome();
          }
      ),
      );

    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.red,

      ),
      child: Text(
        "සිංහල",
        style: TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold,
        ),

      ),

    ),
  ),

],
              )
          )
        ],
      ),
    );
  }
}
