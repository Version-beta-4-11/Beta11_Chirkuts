import 'package:flutter/material.dart';
import 'package:kisan_seva/screens/expert_list.dart';
import 'package:kisan_seva/screens/about.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, //top bar color
      systemNavigationBarColor: Colors.black, //bottom bar color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return _child;*/

    return MaterialApp(
      color: Color(0xFF79C44F),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FirstRoute()),
                );
              },
              child: Icon(
                Icons.question_answer,
                color: Colors.white,
                size: 29,
              ),
              backgroundColor: Color(0xFF79C44F),
              elevation: 5,
              splashColor: Colors.grey,
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
            backgroundColor: Colors.lightGreen[50],
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: Color(0xFF79C44F),
              title: Text(
                "",
                style: TextStyle(
                  fontSize: 60.0,
                  fontFamily: "Glacial indifference",
                  color: Colors.white,
                ),
              ),
            ),
            drawer: Drawer(
              child: ListView(
                padding: const EdgeInsets.all(0.0),
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Color(0xFF79C44F),
                    ),
                    accountName: Text(
                      "Kisan Seva",
                      style: TextStyle(
                        fontSize: 22.0,
                      ),
                    ),
                    accountEmail: Text(""),
                    currentAccountPicture: CircleAvatar(
                      radius: 50.0,
                      backgroundColor: Colors.lightGreen[50],
                      backgroundImage: new NetworkImage(
                          'https://cdn.business2community.com/wp-content/uploads/2017/08/blank-profile-picture-973460_640.png'),
                    ),
                  ),
                  ListTile(
                    title: Text("Home"),
                    leading: Icon(
                      Icons.home,
                      color: Color(0xFF79C44F),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                  ),
                  ListTile(
                    title: Text("About"),
                    leading: Icon(
                      Icons.bookmark,
                      color: Color(0xFF79C44F),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AboutPage()));
                    },
                  ),
                ],
              ),
            ),
            body: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xFF79C44F),
                        width: 3,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    width: double.infinity,
                    height: 400,
                    child: Image.asset("images/KISAN SEVA.png"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExpertPage()));
                    },
                    textColor: Colors.white,
                    padding: EdgeInsets.all(20),
                    color: Color(0xFFFFFFFF),
                    child: Text(
                      "Contact Experts",
                      style: TextStyle(
                          color: Color(0xFF79C44F),
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            )));
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: WebView(
          initialUrl: 'https://kisanseva.hellotars.com/conv/UDTPs8',
          javaScriptMode: JavaScriptMode.unrestricted,
        ),
      ),
    );
  }
}
