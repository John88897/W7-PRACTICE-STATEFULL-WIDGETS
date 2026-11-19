import 'package:flutter/material.dart';

List<String> images = [
  "assets/bird.jpg",
  "assets/bird2.jpg",
  "assets/insect.jpg",
  "assets/girl.jpg",
  "assets/man.jpg",
];

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
    home: ImgViewer(),
  ),
);

class ImgViewer extends StatefulWidget {
  const new({super.key});

  @override
  State<ImgViewer> createState() => _ImgViewerState();
}

class _ImgViewerState extends State<ImgViewer> {
  int _index = 0;
  void _privious() {
    setState(() {
      if (_index == 0) {
        _index = images.length - 1;
      } else {
        _index--;
      }
    });
  }

  void _next() {
    setState(() {
      if (_index == images.length - 1) {
        _index = 0;
      } else {
        _index++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.green[50],
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('Image viewer'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before),
            tooltip: 'Go to the previous image',
            onPressed: _privious,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
            child: IconButton(
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Go to the next image',
              onPressed: _next,
            ),
          ),
        ],
      ),
      body: SizedBox.expand(
        child: Image.asset(images[_index], fit: BoxFit.cover),
      ),
    );
  }
}
