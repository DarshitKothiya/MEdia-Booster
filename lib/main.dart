import 'package:flutter/material.dart';
import 'package:intro_screen/screen/homepage.dart';
import 'package:intro_screen/screen/intro_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  bool isIntroview = prefs.getBool('isintroview') ?? false;

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isIntroview==true)?'dashboard':'/',
      routes: {
        '/': (context) => homepage(),
        'dashboard': (context) => dashboard(),
      },
    )
  );
}
