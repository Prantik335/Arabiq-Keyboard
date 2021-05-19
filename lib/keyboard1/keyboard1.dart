import 'package:flutter/material.dart';
part 'codes.dart';

class Keyboard1 extends StatefulWidget {
  @override
  _Keyboard1State createState() => _Keyboard1State();
}

class _Keyboard1State extends State<Keyboard1> {
  final TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          textDirection: TextDirection.rtl,
          maxLines: 5,
          controller: controller,
          autofocus: false,
          onChanged: onChanged,
          style: TextStyle(fontSize: 32),
          decoration: InputDecoration(border: InputBorder.none),
        ),
      ],
    );
  }

  void onChanged(String text) {
    int position = controller.selection.baseOffset - 1;
    // print("position: $position");

    if (position < 0) return;

    List<String> letters = text.split("");
    String letter = letters[position];

    if (_codes.keys.contains(letter)) {
      letters[position] = _codes[letter];
    } else {
      print("Not implemented!");
    }

    text = letters.join();
    controller.text = text;

    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: ++position),
    );
  }
}
