import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const [
                RowWidget(),
                Padding(
                  padding: EdgeInsets.all(16),
                ),
                RowAndColumnWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Colors.yellow,
          height: 40,
          width: 40,
        ),
        const Padding(
          padding: EdgeInsets.all(16),
        ),
        Expanded(
          child: Container(
            color: Colors.amber,
            height: 40,
            width: 40,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(16),
        ),
        Container(
          color: Colors.brown,
          height: 40,
          width: 40,
        ),
      ],
    );
  }
}

class RowAndColumnWidget extends StatelessWidget {
  const RowAndColumnWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              color: Colors.yellow,
              height: 60,
              width: 60,
            ),
            const Padding(
              padding: EdgeInsets.all(16),
            ),
            Container(
              color: Colors.amber,
              height: 40,
              width: 40,
            ),
            const Padding(
              padding: EdgeInsets.all(16),
            ),
            Container(
              color: Colors.brown,
              height: 20,
              width: 20,
            ),
            const Divider(),
            const RowAndStackWidget(),
            const Divider(),
            const Text('End of the line')
          ],
        ),
      ],
    );
  }
}

class RowAndStackWidget extends StatelessWidget {
  const RowAndStackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.lightGreen,
          radius: 100,
          child: Stack(
            children: [
              Container(
                color: Colors.yellow,
                height: 100,
                width: 100,
              ),
              Container(
                color: Colors.amber,
                height: 60,
                width: 60,
              ),
              Container(
                color: Colors.brown,
                height: 40,
                width: 40,
              ),
            ],
          ),
        )
      ],
    );
  }
}
