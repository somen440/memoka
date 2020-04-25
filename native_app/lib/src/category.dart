import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class Category extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;

  const Category({
    Key key,
    @required this.name,
    @required this.icon,
    @required this.color,
  })  : assert(name != null),
        assert(icon != null),
        assert(color != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: this.color,
          splashColor: this.color,
          onTap: () {
            print('tapped!!');
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Icon(
                    icon,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(
                    name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
