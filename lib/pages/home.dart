import 'package:flutter/material.dart';
import 'package:pogoda/widgets/animated_container.dart';
import 'package:pogoda/widgets/animated_cross_fade.dart';
import 'package:pogoda/widgets/animated_opacity.dart';

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
          child: Column(
        children: const [
          AnimatedContainerWidget(),
          Divider(),
          AnimatedCrossFadeWidget(),
          Divider(),
          AnimatedOpacityWidget(),
        ],
      )),
    );
  }
}
