import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF79C44F),
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "ABOUT",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 36.0,
            fontFamily: 'GlacialIndifference',
            color: Colors.green[50],
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFFa7e882),
                    Color(0xFFb3eb94),
                    Color(0xFFc3ebae),
                  ],
                ),
                color: const Color(0xFF66BB6A),
          boxShadow: [new BoxShadow(
            color: Colors.black,
            blurRadius: 20.0,
          ),],
          border: Border.all(
      color: Colors.black,
    ),
    borderRadius: BorderRadius.all(Radius.circular(10))
              ),
        margin: EdgeInsets.all(25),
        //color: Color(0xFFFFDAE0),
        child: Text("KISAN SEVA helps farmers to get early weather warnings , advice on what and when to grow crops by agricultural experts and also get filtered information on crop rates and various crops that can be grown on a particular soil in a particular weather.",
          style: TextStyle(
            fontSize: 27,
            fontFamily: 'GlacialIndifference',
            color: Colors.black
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
