import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  int initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: initialIndex,
        children: [
          firstPage(),
          secondPage()
        ],
      ),
      floatingActionButton: GestureDetector(
        onTap: () async{
          
          SharedPreferences pref = await SharedPreferences.getInstance();
          
         if(initialIndex==1){
           pref.setBool('isintroview', true);
         }
          
          
          setState(() {
            if(initialIndex<1){
              initialIndex = ++initialIndex;
            }else{
                Navigator.pushReplacementNamed(context, 'dashboard');
            }

          });
        },
        child: Container(
          height: 50,
          width: 120,
          decoration: BoxDecoration(
              color: Colors.teal, borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                (initialIndex<1)?'Next':'Explore',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Icon(Icons.arrow_forward_ios, color: Colors.white)
            ],
          ),
        ),
      ),
    );
  }
}

class firstPage extends StatefulWidget {
  const firstPage({Key? key}) : super(key: key);

  @override
  State<firstPage> createState() => _firstPageState();
}

class _firstPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
              height: 150,
              width: 150,
              child: Image.network(
                  'https://img.icons8.com/external-bearicons-outline-color-bearicons/344/external-Welcome-miscellany-texts-and-badges-bearicons-outline-color-bearicons.png')),
          Text(
            'Made in India 💕',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}

class secondPage extends StatefulWidget {
  const secondPage({Key? key}) : super(key: key);

  @override
  State<secondPage> createState() => _secondPageState();
}

class _secondPageState extends State<secondPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 150,
            width: 150,
            child: Image.network(
                'https://img.icons8.com/bubbles/344/handshake.png'),
          ),
          Text(
            'Nice To Meet You... 🎀',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
