import 'package:flutter/material.dart';

class dashboard extends StatefulWidget {
  const dashboard({Key? key}) : super(key: key);

  @override
  State<dashboard> createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Dashboard'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Welcome to dashboard',style: TextStyle(fontSize: 22),),
      ),
    );
  }
}
