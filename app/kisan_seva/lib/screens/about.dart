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
        padding: EdgeInsets.all(15),
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
        child: Text("S.H.E. allows the privileged group of people to come together to help out the women who do not have the luxury or rather the necessity of a sanitary menstrual cycle. Through S.H.E. donors or volunteers can come forward and bring about a change in the lives of the much affected rural women and help them out by donating sanitary pads, tampons or menstrual cups so that they too can live a healthy and happy life.",
          style: TextStyle(
            fontSize: 27,
            fontFamily: 'GlacialIndifference',
            color: Color(0xFF79C44F)
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
