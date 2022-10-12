import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff6b9080),
      appBar: AppBar(
        title: const Text(
          'Register Form',
        ),
        centerTitle: true,
        backgroundColor: Color(0xff6b9080),
        elevation: 0,
      ),
      body: Container(
        margin: EdgeInsets.only(top: _height * 0.12),
        padding: EdgeInsets.symmetric(horizontal: _width * 0.10),
        height: _height * 0.78,
        width: _width,
        decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                spreadRadius: 2,
                blurRadius: 5,
              )
            ],
            color: Color(0xffcce3de),
            borderRadius: BorderRadius.only(topLeft: Radius.circular(70))),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const Spacer(),
              TextFormField(
                controller: usernameController,
                validator: (val){
                  if(val!.isEmpty){
                    return 'Enter Password First';
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Enter Email',
                    label: Text('Email'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: passwordController,
                validator: (val){
                  if(val!.isEmpty){
                    return 'Enter Password First';
                  }
                },
                decoration: InputDecoration(
                    hintText: 'Enter Password',
                    label: Text('Password'),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const Spacer(),
              SizedBox(
                height: 50,
                width: _width,
                child: ElevatedButton(
                  onPressed: () {

                    saveData() async{

                      SharedPreferences pref = await SharedPreferences.getInstance();

                      String username = usernameController.text;
                      String password = passwordController.text;

                      pref.setBool('isRegister', true);
                      pref.setString('username', username);
                      pref.setString('password', password);

                    }


                    setState(() {
                      if(formKey.currentState!.validate()){
                        saveData();
                        Navigator.pushReplacementNamed(context, 'login');
                      }
                    });
                  },
                  child: Text('Sign Up'),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
