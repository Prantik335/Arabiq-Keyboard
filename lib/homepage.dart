import 'package:arabiq_keyboard/keyboard2/keyboard2.dart';
import 'package:arabiq_keyboard/keyboard1/keyboard1.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          constraints: BoxConstraints(
            maxWidth: 900,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: ToggleButtons(
                  children: List.generate(
                    2,
                    (index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text("Keyboard ${index + 1}"),
                    ),
                  ),
                  isSelected: List.generate(2, (index) => index == _index),
                  onPressed: (index) {
                    setState(() {
                      _index = index;
                    });
                  },
                ),
              ),
              IndexedStack(
                index: _index,
                children: [
                  Keyboard1(),
                  Keyboard2(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
