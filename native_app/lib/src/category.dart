import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  String _name;
  IconData _icon;
  Color _color;

  Category(this._name, this._icon, this._color);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      padding: EdgeInsets.all(8.0),
      child: InkWell(
        borderRadius: BorderRadius.circular(50.0),
        onTap: () {
          print('tapped!!');
        },
        splashColor: this._color,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Icon(
                this._icon,
                size: 60.0,
              ),
            ),
            Text(
              this._name,
              style: TextStyle(fontSize: 24.0),
            )
          ],
        ),
      ),
    );
  }
}
