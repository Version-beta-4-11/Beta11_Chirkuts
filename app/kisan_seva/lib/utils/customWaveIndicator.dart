import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class WaveIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitWave(
          color: Color.fromARGB(1000, 121, 196, 79),
          type: SpinKitWaveType.start),
    ));
  }
}
