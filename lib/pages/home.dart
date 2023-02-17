import 'package:flutter/material.dart';

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
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                OrientationLayoutIconsWidget(),
                Divider(),
                OrientationLayoutWidget(),
                Divider(),
                GridViewWidget(),
                Divider(),
                OrientationBuilderWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrientationLayoutIconsWidget extends StatelessWidget {
  const OrientationLayoutIconsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.portrait
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.school,
                size: 48,
              ),
            ],
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.school,
                size: 48,
              ),
              Icon(
                Icons.brush,
                size: 48,
              )
            ],
          );
  }
}

class OrientationLayoutWidget extends StatelessWidget {
  const OrientationLayoutWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;

    if (orientation == Orientation.portrait) {
      return Container(
        color: Colors.yellow,
        width: 100,
        height: 100,
      );
    } else {
      return Container(
        color: Colors.green,
        width: 200,
        height: 200,
      );
    }
  }
}

class GridViewWidget extends StatelessWidget {
  const GridViewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return GridView.count(
      crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 5,
      children: List.generate(8, (index) {
        return Text(
          "Grid $index",
          textAlign: TextAlign.center,
        );
      }),
    );
  }
}

class OrientationBuilderWidget extends StatelessWidget {
  const OrientationBuilderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.portrait
          ? Container(
              alignment: Alignment.center,
              color: Colors.yellow,
              height: 100,
              width: 100,
              child: Text('Portrait'),
            )
          : Container(
              alignment: Alignment.center,
              color: Colors.lightGreen,
              height: 100,
              width: 200,
              child: Text('Landscape'),
            );
    });
  }
}
