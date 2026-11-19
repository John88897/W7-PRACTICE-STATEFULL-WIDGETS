import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Center(
        child: Column(
          spacing: 5,
          children: [
            SelectableButton(),
            SelectableButton(),
            SelectableButton(),
            SelectableButton(),
          ],
        ),
      ),
    ),
  ),
);

class SelectableButton extends StatefulWidget {
  const new({super.key});

  @override
  State<SelectableButton> createState() => _SelectableButtonState();
}

class _SelectableButtonState extends State<SelectableButton> {
  bool isSelected = false;
  String get label => isSelected ? 'selected' : 'Not Selected';
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get getBgColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;
  void onPressed(){
    setState(() {
            isSelected = !isSelected;
          });
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: getBgColor),
        onPressed: onPressed,
        child: Text(label, style: TextStyle(color: textColor)),
      ),
    );
  }
}
