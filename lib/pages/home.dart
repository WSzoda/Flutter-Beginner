import 'package:flutter/material.dart';
import 'package:pogoda/widgets/animated_balloon.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                AnimatedBaloonWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
