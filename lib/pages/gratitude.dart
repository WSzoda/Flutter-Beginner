import 'package:flutter/material.dart';

class Gratitude extends StatefulWidget {
  final int radioGroupValue;

  const Gratitude({super.key, required this.radioGroupValue});

  @override
  State<Gratitude> createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  late List<String> _gratitudeList;
  late String _selectedGratitude;
  late int _radioGroupValue;

  void _radioOnChanged(int index) {
    setState(() {
      _radioGroupValue = index;
      _selectedGratitude = _gratitudeList[index];
      print('$_radioGroupValue $_selectedGratitude');
    });
  }

  @override
  void initState() {
    super.initState();

    _gratitudeList = ['Family', 'Friends', 'Coffe'];
    _radioGroupValue = widget.radioGroupValue;
    _selectedGratitude = "...";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () => Navigator.pop(context, _selectedGratitude),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                Radio(
                  value: 0,
                  groupValue: _radioGroupValue,
                  onChanged: (index) => _radioOnChanged(index!),
                ),
                Text('Family'),
                Radio(
                  value: 1,
                  groupValue: _radioGroupValue,
                  onChanged: (index) => _radioOnChanged(index!),
                ),
                Text('Friends'),
                Radio(
                  value: 2,
                  groupValue: _radioGroupValue,
                  onChanged: (index) => _radioOnChanged(index!),
                ),
                Text('Coffe'),
              ],
            )),
      ),
    );
  }
}
