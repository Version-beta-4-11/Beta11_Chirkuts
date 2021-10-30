import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// //
import '../utils/customWaveIndicator.dart';
// import 'personalchat.dart';

class ExpertPage extends StatefulWidget {
  @override
  _ExpertPageState createState() => _ExpertPageState();
}

class _ExpertPageState extends State<ExpertPage> {
  List experts = [];
  late Widget _child;

  @override
  void initState() {
    _child = WaveIndicator();
    getDonors();
    super.initState();
  }

  var fsconnect=FirebaseFirestore.instance;
  String _state='Andhra Pradesh';

  Future<Null> getDonors() async {
    var d= await fsconnect.collection("Experts").get();
    for (int i = 0; i < d.docs.length; ++i) {
          if(d.docs[i].data()!=null)
          {
             var don={
               
              'name': d.docs[i].data()['name'],
              'phoneno': d.docs[i].data()['phoneno'],
              'state' : d.docs[i].data()['state'],
            };
              experts.add(don);
          }
        }
    setState(() {
      _child = myWidget();
    });
  }

  Widget myWidget() {
    // ignore: unnecessary_statements, unused_label
    debugShowCheckedModeBanner: false;
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        title: Text(
          "Expert's Phone No. Statewise",
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 20.0,
            fontFamily: "GlacialIndifference",
            color: Color(0xFF79C44F),
          ),
        ),
         leading: IconButton(
          icon: Icon(
            FontAwesomeIcons.reply,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body:  ClipRRect(
        borderRadius: new BorderRadius.only(
            topLeft: const Radius.circular(40.0),
            topRight: const Radius.circular(40.0)),
        child: Container(
          height: 800.0,
          width: double.infinity,
          color: Color(0xFF79C44F),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: experts.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      Text(experts[index]["name"],style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                      Text(experts[index]["phoneno"],style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      Text(experts[index]["state"],style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                      //Text(volunteers[index]["phoneno"]),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _child;
  }
}
