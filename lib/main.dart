import 'package:flutter/material.dart';
import 'package:multimedia/screen/Audioplayer.dart';
import 'package:multimedia/screen/audioplaypage.dart';
void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context)=> const AudioPlayer(),
        'play': (context)=> const playpage(),
      },
    )
  );
}