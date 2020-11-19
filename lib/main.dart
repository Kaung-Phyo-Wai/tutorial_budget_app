import 'package:flutter/material.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Simple Budget"),
            actions: [
              IconButton(icon: Icon(Icons.add), onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}
