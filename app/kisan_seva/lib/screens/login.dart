import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'register.dart';
import 'weather.dart';
//import 'home.dart';

class AuthPage extends StatefulWidget {
  //final FirebaseAuth appAuth;
  //AuthPage(this.appAuth);
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  var authc = FirebaseAuth.instance;
  final formkey = new GlobalKey<FormState>();
  late String _email;
  late String _password;
  bool sspin=false;
  bool validate_save() {
    final form = formkey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void validate_submit() async {
      sspin=true;
      try {
                        var userSignin = await authc.signInWithEmailAndPassword(
                            email: _email, password: _password);
                        print(userSignin);

                        if (userSignin != null) {
                           Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      WeatherApp()));
                          setState(() {
                            sspin = false;
                          });
                        }
                      } catch (e) {
                        print(e);
                      }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      systemNavigationBarColor: Colors.black, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor:  Color(0xFF79C44F),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Container(
              child: Center(
                child: Image.asset('./images/KISAN SEVA.png')
              ),
              height: MediaQuery.of(context).size.height/2.5,
            ),
            ClipRRect(
              borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(40.0),
                  topRight: const Radius.circular(40.0)),
              child: Container(
                height: MediaQuery.of(context).size.height-MediaQuery.of(context).size.height/2.5,
                width: double.infinity,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: new Form(
                          key: formkey,
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Email ID',
                                    icon: Icon(
                                      Icons.email,
                                      color: Color(0xFF79C44F),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    _email=value;
                                  },
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: TextField(
                                  decoration: InputDecoration(
                                    hintText: 'Password',
                                    icon: Icon(
                                      Icons.lock,
                                      color: Color(0xFF79C44F),
                                    ),
                                  ),
                                  obscureText: true,
                                  onChanged: (value) {
                                    _password=value;
                                  },
                                ),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
                              RaisedButton(
                                onPressed: validate_submit,
                                textColor: Colors.white,
                                padding: EdgeInsets.only(left: 5.0, right: 5.0),
                                color: Color(0xFF79C44F),
                                child: Text("LOGIN"),
                                shape: new RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(30.0)),
                                
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text("New User? "),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      RegisterPage(authc)));
                                        },
                                        child: Text(
                                          "Click here",
                                          style: TextStyle(
                                            color: Color.fromARGB(1000, 121,196,79),
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}