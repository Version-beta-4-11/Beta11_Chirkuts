import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'weather.dart';
import 'login.dart';
import 'landing_page.dart';

class Home extends StatefulWidget {
  static final String routeName = 'home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKeyHome = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KISAN SEVA", style: TextStyle(color: Colors.white),),
        backgroundColor: Color(0xFF79C44F),
      ),
      body: Landing(),
    );
  }
}
