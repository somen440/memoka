import 'package:clearbook/src/unit.dart';
import 'package:flutter/material.dart';

class ConverterRoute extends StatelessWidget {
  final List<Unit> units;
  final Color color;
  final String categoryName;

  const ConverterRoute({
    @required this.units,
    @required this.color,
    @required this.categoryName,
  })  : assert(units != null),
        assert(color != null),
        assert(categoryName != null);

  @override
  Widget build(BuildContext context) {
    final unitWidgets = units.map((Unit unit) {
      return Container(
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        color: color,
        child: Column(
          children: [
            Text(
              unit.name,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          categoryName,
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.black,
          ),
        ),
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: color,
      ),
      body: ListView(
        children: unitWidgets,
      ),
    );
    ListView(
      children: unitWidgets,
    );
  }
}
