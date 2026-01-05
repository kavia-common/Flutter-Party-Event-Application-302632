import 'package:day9_party/Animation/fade_animation.dart';
import 'package:flutter/material.dart';

class FindEvent extends StatelessWidget {
  const FindEvent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(246, 248, 253, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        // `brightness` was removed from AppBar in newer Flutter versions.
        // If a status bar style is required, use SystemUiOverlayStyle via
        // AppBar.systemOverlayStyle or AnnotatedRegion<SystemUiOverlayStyle>.
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  image: AssetImage('assets/images/four.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Transform.translate(
                offset: const Offset(15, -15),
                child: Container(
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.white),
                    shape: BoxShape.circle,
                    color: Colors.yellow[800],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeAnimation(
                1,
                Container(
                  padding: const EdgeInsets.only(top: 5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      hintText: 'Search Event',
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              FadeAnimation(1.2, makeItem(image: 'assets/images/one.jpg', date: 17)),
              const SizedBox(height: 20),
              FadeAnimation(1.3, makeItem(image: 'assets/images/two.jpg', date: 18)),
              const SizedBox(height: 20),
              FadeAnimation(1.4, makeItem(image: 'assets/images/three.jpg', date: 19)),
              const SizedBox(height: 20),
              FadeAnimation(1.5, makeItem(image: 'assets/images/four.jpg', date: 20)),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({required String image, required int date}) {
    return Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 200,
          margin: const EdgeInsets.only(right: 20),
          child: Column(
            children: <Widget>[
              Text(
                date.toString(),
                style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'SEP',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withAlpha((0.4 * 255).round()),
                    Colors.black.withAlpha((0.1 * 255).round()),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    'Bumbershoot 2019',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: <Widget>[
                      Icon(Icons.access_time, color: Colors.white),
                      SizedBox(width: 10),
                      Text('19:00 PM', style: TextStyle(color: Colors.white))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
