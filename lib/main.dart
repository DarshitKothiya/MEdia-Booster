import 'package:flutter/material.dart';
import 'package:login/screen/dashboard.dart';
import 'package:login/screen/login.dart';
import 'package:login/screen/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences pref = await SharedPreferences.getInstance();

  bool isRegister = pref.getBool('isRegister') ?? false;
  bool isLogin = pref.getBool('isLogin') ?? false;
  print(isLogin);


  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: (isRegister==false)
                          ?'/'
                          :(isLogin)
                              ?'home'
                              :'login',
      routes: {
        '/': (context) => const register(),
        'login': (context) => const login(),
        'home': (context) =>const hompeage(),
      },
    )
  );
}