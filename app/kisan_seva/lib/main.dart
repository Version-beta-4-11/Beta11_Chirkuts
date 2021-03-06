import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:kisan_seva/screens/splashscreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color(0xFF79C44F),
      debugShowCheckedModeBanner: false,
      home: Splash(),
    );
  }
}


