import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:kisan_seva/style/color.dart';
import 'package:translator/translator.dart';

class tts extends StatefulWidget {
  @override
  _tts createState() => _tts();
}

enum TtsState { playing, stopped }

class _tts extends State<tts> {
  GoogleTranslator translator = GoogleTranslator();
  FlutterTts? flutterTts;
  dynamic languages;
  String? language;
  double volume = 0.5;
  double pitch = 1.0;
  double rate = 0.5;
  var output;

  String? _newVoiceText =
      "If you are a farm expert then do register yourselves to help farmers else if you are a farmer then continue using the app. The contact experts button will help you to get the list of all agricultural experts with their phone numbers . The button with a question mark will help you to navigate to various tabs on the app. The weather icon button on bottom tab will give weather forecast for the upcoming week and the audio icon will give instructions on how to use the app in language of your choice.";
  String lan = "hi";
  TtsState ttsState = TtsState.stopped;

  get isPlaying => ttsState == TtsState.playing;

  get isStopped => ttsState == TtsState.stopped;
  void trans() {
    translator.translate(_newVoiceText!, to: lan).then((value) {
      setState(() {
        output = value;
      });
    });
  }

  @override
  initState() {
    super.initState();
    initTts();
  }

  initTts() {
    flutterTts = FlutterTts();

    _getLanguages();

    flutterTts?.setStartHandler(() {
      setState(() {
        print("playing");
        ttsState = TtsState.playing;
      });
    });

    flutterTts?.setCompletionHandler(() {
      setState(() {
        print("Complete");
        ttsState = TtsState.stopped;
      });
    });

    flutterTts?.setErrorHandler((msg) {
      setState(() {
        print("error: $msg");
        ttsState = TtsState.stopped;
      });
    });
  }

  Future _getLanguages() async {
    languages = await flutterTts?.getLanguages;
    print("pritty print ${languages}");
    if (languages != null) setState(() => languages);
  }

  Future _speak() async {
    await flutterTts?.setVolume(volume);
    await flutterTts?.setSpeechRate(rate);
    await flutterTts?.setPitch(pitch);
    trans();
    if (output != null) {
      //trans();
      print(output.toString());
      var result = await flutterTts?.speak(output.toString());
      if (result == 1) setState(() => ttsState = TtsState.playing);
    }
  }

  Future _stop() async {
    var result = await flutterTts?.stop();
    if (result == 1) setState(() => ttsState = TtsState.stopped);
  }

  @override
  void dispose() {
    super.dispose();
    flutterTts?.stop();
  }

  List<DropdownMenuItem<String>> getLanguageDropDownMenuItems() {
    var items = <DropdownMenuItem<String>>[];
    for (String type in languages) {
      if (type.length == 5) {
        if (type[3] == 'I' && type[4] == 'N') {
          if (type[0] == 't' && type[1] == 'a')
            items.add(DropdownMenuItem(value: type, child: Text('Tamil')));
          else if (type[0] == 't' && type[1] == 'e')
            items.add(DropdownMenuItem(value: type, child: Text('Telugu')));
          else if (type[0] == 'm' && type[1] == 'l')
            items.add(DropdownMenuItem(value: type, child: Text('Malyalam')));
          else if (type[0] == 'm' && type[1] == 'r')
            items.add(DropdownMenuItem(value: type, child: Text('Marathi')));
          else if (type[0] == 'g')
            items.add(DropdownMenuItem(value: type, child: Text('Gujarati')));
          else if (type[0] == 'b')
            items.add(DropdownMenuItem(value: type, child: Text('Bengali')));
          else if (type[0] == 'h')
            items.add(DropdownMenuItem(value: type, child: Text('Hindi')));
          else if (type[0] == 'e')
            items.add(DropdownMenuItem(value: type, child: Text('English')));
          else
            items.add(DropdownMenuItem(value: type, child: Text('Kannad')));
        }
      }
    }
    return items;
  }

  void changedLanguageDropDownItem(String? selectedType) {
    setState(() {
      language = selectedType;
      {
        if (language == "ta-IN")
          lan = "ta";
        else if (language == "bn-IN")
          lan = "bn";
        else if (language == "gu-IN")
          lan = "gu";
        else if (language == "hi-IN")
          lan = "hi";
        else if (language == "mr-IN")
          lan = "mr";
        else if (language == "en-IN")
          lan = "en";
        else if (language == "kn-IN")
          lan = "kn";
        else if (language == "ml-IN")
          lan = "ml";
        else if (language == "te-IN") lan = "te";
      }
      flutterTts?.setLanguage(language!);
    });
  }

  void _onChange(String text) {
    setState(() {
      _newVoiceText = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightGreen[50],
        bottomNavigationBar: bottomBar(),
        appBar: AppBar(
          title: Text(
            'Audio Instructions',
          ),
          centerTitle: true,
          backgroundColor: Color(0xFF79C44F),
        ),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(children: [
              _inputSection(),
              languages != null ? _languageDropDownSection() : Text("hi-IN"),
            ])));
  }

  Widget _inputSection() => Container(
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 25.0, left: 25.0, right: 25.0),
      child: Text("Learn how to make the best of this Application"));

  Widget _languageDropDownSection() => Container(
      padding: EdgeInsets.only(top: 50.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        DropdownButton(
          value: language,
          items: getLanguageDropDownMenuItems(),
          onChanged: changedLanguageDropDownItem,
        )
      ]));

  Column _buildButtonColumn(Color color, Color splashColor, IconData icon,
      String label, Function func) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              icon: Icon(icon),
              color: color,
              splashColor: splashColor,
              onPressed: () => func()),
          Container(
              margin: const EdgeInsets.only(top: 8.0),
              child: Text(label,
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w400,
                      color: color)))
        ]);
  }

  bottomBar() => Container(
        margin: EdgeInsets.all(10.0),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _speak,
              child: Icon(Icons.play_arrow),
              backgroundColor: Colors.green,
            ),
            FloatingActionButton(
              onPressed: _stop,
              backgroundColor: Colors.red,
              child: Icon(Icons.stop),
            ),
          ],
        ),
      );
}
