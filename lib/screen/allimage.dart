import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class allimage extends StatefulWidget {
  const allimage({Key? key}) : super(key: key);

  @override
  State<allimage> createState() => _allimageState();
}

class _allimageState extends State<allimage> {
  @override
  Widget build(BuildContext context) {

    var res = ModalRoute.of(context)!.settings.arguments;

    dynamic fromRes = res;
    List image = fromRes[0];
    String titleText = fromRes[1];

    return Scaffold(
        appBar: AppBar(
          title: Text(titleText),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 350,
            enlargeCenterPage: true,
            viewportFraction: 0.75,
          ),
          items: image.map((e) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(e['image']),
                        fit: BoxFit.cover
                      )
                    ),
                );
              },
            );
          }).toList(),
        ),
      ),
    );
  }
}
