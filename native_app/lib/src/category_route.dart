import 'package:clearbook/src/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _backgroundColor = Colors.green[100];

class CategoryRoute extends StatelessWidget {
  const CategoryRoute();

  static const _categoryName = <String>[
    'Length',
    'Area',
    'Volume',
    'Mass',
    'Time',
    'Digital Storage',
    'Energy',
    'Currency',
  ];

  static const _baseColors = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  @override
  Widget build(BuildContext context) {
    final listView = Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: List.generate(
            _categoryName.length,
            (i) => Category(
                  name: _categoryName[i],
                  color: _baseColors[i],
                  icon: Icons.cake,
                )),
      ),
    );

    final appBar = AppBar(
      title: Text(
          'Unit Converter',
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black,
          ),
      ),
      elevation: 0.0,
      centerTitle: true,
      backgroundColor: _backgroundColor,
    );

    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
