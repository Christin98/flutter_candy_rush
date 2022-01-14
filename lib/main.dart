import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_candy_rush/application.dart';

void main() async {

  //
  // Initialize the audio
  //

  //
  // Remove the status bar
  //
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

  return runApp( const Application());
}


