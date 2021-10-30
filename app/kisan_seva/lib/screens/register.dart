import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  final FirebaseAuth appAuth;
  RegisterPage(this.appAuth);
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

// ignore: camel_case_types
class registerp {
  
  static String n="0", e="0", c="0", p="0", g="0",r="0";
}

class _RegisterPageState extends State<RegisterPage> {
  final formkey = new GlobalKey<FormState>();
  late String _state='Andhra Pradesh';
  late String _email;
  late String _password;
  late String _name;
  late String _city;
  List<String> _role = ['Donor', 'Volunteer'];
  List<String> _gender = ['Female', 'Male'];
  late String _phoneno;
  String _selectedr = '';
  String _selectedg = '';

  bool isLoggedIn() {
    if (FirebaseAuth.instance.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addData(_user) async {
    if (isLoggedIn()) {
      // ignore: deprecated_member_use
      Firestore.instance
          .collection('User Details')
          // ignore: deprecated_member_use
          .document(_user['uid'])
          // ignore: deprecated_member_use
          .setData(_user)
          .catchError((e) {
        print(e);
      });
    } else {
      print('You need to be logged In');
    }
  }

  // ignore: non_constant_identifier_names
  bool validate_save() {
    final form = formkey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
  var authc= FirebaseAuth.instance;
  var fsconnect=FirebaseFirestore.instance;
  // ignore: non_constant_identifier_names
  void validate_submit(BuildContext context) async {
    try {
                      var user = await authc.createUserWithEmailAndPassword(
                        email: _email,
                        password: _password,
                      );
                      fsconnect.collection("Experts").add({
                          'name': _name,
                          'email': _email,
                          'password' : _password,
                          'phoneno': _phoneno,
                          'state': _state,
                      });
                      // if(_selectedr=='Donor'){
                      // fsconnect.collection("Donors").add({
                      //     'name': _name,
                      //     'email': _email,
                      //     'password' : _password,
                      //     'phoneno': _phoneno,
                      //     'city': _city,
                      // });
                      // }
                      // else
                      // {
                      //     fsconnect.collection("Volunteers").add({
                      //     'name': _name,
                      //     'email': _email,
                      //     'password' : _password,
                      //     'phoneno': _phoneno,
                      //     'city': _city,
                      // });
                      //}
                      print(_email);
                      print(_password);
                      print(user);

                      if (user.additionalUserInfo!.isNewUser == true) {
                        Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      AuthPage()));
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
    debugShowCheckedModeBanner: false; // ignore: unnecessary_statements, unused_label
    return Scaffold(
      backgroundColor: Color(0xFF79C44F),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Register as an Expert",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: 'GlacialIndifference',
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: ClipRRect(
        borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(40.0),
            topRight: const Radius.circular(40.0)),
        child: Container(
          padding: EdgeInsets.all(30),
          height: 700.0,
          width: double.infinity,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Form(
                  key: formkey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Name',
                            icon: Icon(
                              Icons.person_add,
                              color: Color(0xFF79C44F),
                            ),
                          ),
                          onChanged: (value) {
                            _name=value;
                            registerp.n=value;
                          },
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            // Container(
                            //   padding: EdgeInsets.only(top: 10.0),
                            //   child: DropdownButton(
                            //     hint: Text(
                            //       'Gender',
                            //       style: TextStyle(
                            //         color: Color(0xFFFF748C),
                            //       ),
                            //     ),
                            //     iconSize: 40.0,
                            //     items: _gender.map((val) {
                            //       return new DropdownMenuItem<String>(
                            //         value: val,
                            //         child: new Text(val),
                            //       );
                            //     }).toList(),
                            //     onChanged: (newValue) {
                            //       setState(() {
                            //         _selectedg = newValue;
                            //         registerp.g=newValue;
                            //       });
                            //     },
                            //   ),
                            // ),
                          
                           
                      Padding(
                        padding: const EdgeInsets.all(10.0),
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
                            registerp.e=value;
                          },
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Phone Number',
                            icon: Icon(
                              Icons.phone,
                              color: Color(0xFF79C44F),
                            ),
                          ),
                          onChanged: (value) {
                            _phoneno=value;
                            registerp.p=value;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
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
                      Row(
                  children: [
                    Text("Select State        ",style:TextStyle(color:  Color(0xFF79C44F)),),
                    DropdownButton<String>(
      value: _state,
      icon: const Icon(Icons.arrow_drop_down_circle_outlined),
      iconSize: 24,
      elevation: 16,
      style: Theme.of(context).textTheme.bodyText1,
      underline: Container(
        height: 2,
        color:  Color(0xFF79C44F),
      ),
      onChanged: (String? newValue) {
        setState(() {
          _state = newValue!;
        });
      },
      items: <String>['Andhra Pradesh', 'Arunachal Pradesh', 'Assam', 'Bihar', 'Chhattisgarh','Goa','Gujrat','Haryana','	Himachal Pradesh','Jharkhand','Karnataka','Kerala','Madhya Pradesh','Maharashtra',
      'Manipur','Meghalaya','Mizoram']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    ),
                  ],
                ),
                      // Padding(
                      //         padding: const EdgeInsets.all(18.0),
                      //         child: TextField(
                      //           decoration: InputDecoration(
                      //             hintText: 'City',
                      //             icon: Icon(
                      //               Icons.location_city,
                      //               color: Color(0xFF79C44F),
                      //             ),
                      //           ),
                      //           onChanged: (value) {
                      //             _city = value;
                      //             registerp.c=value;
                      //           },
                      //         ),
                      //       ),
                      // Container(
                      //   child: Column(
                      //     children: <Widget>[
                      //       Container(
                      //         padding: EdgeInsets.only(top: 20.0),
                      //         child: DropdownButton(
                      //           hint: Text(
                      //             'Please choose your role',
                      //             style: TextStyle(
                      //               color: Color(0xFFFF748C),
                      //             ),
                      //           ),
                      //           iconSize: 40.0,
                      //           items: _role.map((val) {
                      //             return new DropdownMenuItem<String>(
                      //               value: val,
                      //               child: new Text(val),
                      //             );
                      //           }).toList(),
                      //           onChanged: (newValue) {
                      //             setState(() {
                      //               _selectedr = newValue;
                      //               registerp.r=newValue;
                      //             });
                      //           },
                      //         ),
                      //       ),
                            
                      //       Text(
                      //         _selectedr,
                      //         style: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 20.0,
                      //           color: Color(0xFFFF748C),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      
                      // ignore: deprecated_member_use
                      SizedBox(
                                height: 30.0,
                              ),
                      RaisedButton(
                        onPressed: () => validate_submit(context),
                        textColor: Colors.white,
                        padding: EdgeInsets.all(20),
                        color: Color(0xFF79C44F),
                        child: Text("REGISTER",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'GlacialIndifference',
                              fontSize: 20
                          ),
                        ),

                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
        ],
            ),
          ),
        ),
      ),
    );
  }
}
