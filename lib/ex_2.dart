import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(children: [FavCard(), FavCard(), FavCard(), FavCard()]),
    ),
  ),
);

class FavCard extends StatefulWidget {
  const new({super.key});

  @override
  State<FavCard> createState() => _FavCardState();
}

class _FavCardState extends State<FavCard> {

  bool isFavorite = false;
  Color get favColor => isFavorite ? Colors.red : Colors.grey;
  void onPressed() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey, width: 1.5)),
      ), // YOUR CODE
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text('title', style: TextStyle(color: Colors.blue, fontWeight: FontWeight(24)),), Text('description')]),
          ),
          IconButton(onPressed: onPressed, icon: Icon(isFavorite? Icons.favorite : Icons.favorite_border, color: favColor,), color: favColor,)
          
        ],
      ),
    );
  }
}
