import 'package:flutter/material.dart';
import 'about.dart';
import 'gratitude.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _howAreYou = "...";

  void _openPageAbout(
      {required BuildContext context, bool fullscreenDialog = false}) {
    Navigator.push(
      context,
      MaterialPageRoute(
        fullscreenDialog: fullscreenDialog,
        builder: (context) => About(),
      ),
    );
  }

  void _openPageGratitude(
      {required BuildContext context, bool fullscreenDialog = false}) async {
    final String gratitudeResponse = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Gratitude(radioGroupValue: -1),
      ),
    );
    setState(() {
      _howAreYou = gratitudeResponse ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () =>
                _openPageAbout(context: context, fullscreenDialog: true),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Grateful for: $_howAreYou',
            style: const TextStyle(
              fontSize: 32,
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openPageGratitude(context: context),
        child: Icon(Icons.sentiment_satisfied),
        tooltip: 'About',
      ),
    );
  }
}
