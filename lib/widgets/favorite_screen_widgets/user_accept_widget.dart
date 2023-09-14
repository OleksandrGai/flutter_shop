import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UserAcceptWidget extends StatefulWidget {
  const UserAcceptWidget({
    super.key,
    required this.mainText,
    this.underlineText,
  });

  final String mainText;
  final String? underlineText;

  @override
  State<UserAcceptWidget> createState() => _UserAcceptWidgetState();
}

class _UserAcceptWidgetState extends State<UserAcceptWidget> {
  bool _tabStatus = false;
  Color _colorContainer = Colors.grey.shade300;
  Color _colorText = Colors.grey.shade500;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _colorContainer = _colorContainer == Colors.black
                  ? Colors.grey.shade300
                  : Colors.black;
              _tabStatus = _tabStatus == true ? false : true;
              _colorText = _colorText == Colors.black
                  ? Colors.grey.shade500
                  : Colors.black;
            });
          },
          child: Container(
            height: 20,
            width: 20,
            color: _colorContainer,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Flexible(
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text.rich(
              TextSpan(
                  text: widget.mainText,
                  style: TextStyle(
                    overflow: TextOverflow.visible,
                    color: _colorText,
                    fontSize: 15,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => print('Заглушка'),
                        text: widget.underlineText,
                        style: TextStyle(
                          overflow: TextOverflow.visible,
                          fontSize: 15,
                          color: _colorText,
                          decoration: TextDecoration.underline,
                        ))
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
