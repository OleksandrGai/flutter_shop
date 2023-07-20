import 'package:flutter/material.dart';

class SexToggleButtons extends StatefulWidget {
  const SexToggleButtons({super.key});

  @override
  State<SexToggleButtons> createState() => _SexToggleButtonsState();
}

class _SexToggleButtonsState extends State<SexToggleButtons> {
  List<bool> _isSelected = [true, false, false];

  void _sexSwitch(int newIndex) {
    setState(() {
      for (var index = 0; index < _isSelected.length; index++) {
        if (index == newIndex) {
          _isSelected[index] = true;
        } else {
          _isSelected[index] = false;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 40.0, right: 50.0),
          child: Text('Вона'),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.0, right: 50.0),
          child: Text('Він'),
        ),
        Padding(
          padding: EdgeInsets.only(left: 50.0, right: 40.0),
          child: Text('Діти'),
        ),
      ],
      splashColor: Colors.grey.shade200,
      renderBorder: false,
      fillColor: Colors.transparent,
      isSelected: _isSelected,
      onPressed: _sexSwitch,
    );
  }
}
