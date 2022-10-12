import 'package:flutter/material.dart';

class hompeage extends StatefulWidget {
  const hompeage({Key? key}) : super(key: key);

  @override
  State<hompeage> createState() => _hompeageState();
}

class _hompeageState extends State<hompeage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Center(
        child: Text('Welcome to Homepage',style: TextStyle(fontSize: 22),),
      ),
    );
  }
}
