import 'package:flutter/material.dart';
import 'package:gallary/screen/allimage.dart';
import 'package:gallary/screen/homepage.dart';

void main(){
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const homepage(),
        'image': (context) => const allimage(),
      },
    )
  );
}