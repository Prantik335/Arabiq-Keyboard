import 'package:flutter/material.dart';
part 'codes.dart';

class Keyboard2 extends StatefulWidget {
  @override
  _Keyboard2State createState() => _Keyboard2State();
}

class _Keyboard2State extends State<Keyboard2> {
  final TextEditingController controller = TextEditingController(text: "");

  @override
  void initState() {
    super.initState();

    controller.addListener(() {
      print(controller.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          textDirection: TextDirection.rtl,
          maxLines: 5,
          controller: controller,
          autofocus: true,
          onChanged: onChanged,
          style: TextStyle(fontSize: 32),
          decoration: InputDecoration(border: InputBorder.none),
        ),
      ],
    );
  }

  void onChanged(String text) {
    int position = controller.selection.baseOffset - 1;
    // print("[KeyBoard2] position: $position");

    if (position < 0) return;

    List<String> letters = text.split("");
    letters.forEach(print);
    String letter = letters[position];
    String pLetter = '';
    if (position > 0) pLetter = letters[position - 1];

    if (_codes.keys.contains(letter) || _horkotsByauie.containsKey(letter)) {
      print("Letter: $letter, Previous Letter: $pLetter");
      if (_horkots.contains(pLetter) || pLetter == "") {
        if (letter != "o") {
          letters[position] = _codes[letter];
        } else {
          if (pLetter == _horkots[3]) {
            print(letters);
            letters[position] = "ّ";
            letters.removeAt(position - 1);
            letters.removeAt(position + 1);
            print(position);
            print(letters);
          }
        }
      } else if (_horkotsByauie.containsKey(letter)) {
        print(pLetter != " ");
        if (pLetter != " ") {
          letters[position] = _horkotsByauie[letter];
        } else {
          letters[position] = _horkotsByauie[letter];
          letters.removeAt(position - 1);
        }
      } else {
        letters[position] = _codes[letter];
      }
    } else {
      print("Not implemented!");
    }

    text = letters.join();
    controller.text = text;

    controller.selection = TextSelection.fromPosition(
      TextPosition(offset: position + 1),
    );
  }
}
