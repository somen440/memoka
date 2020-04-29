import 'package:clearbook/src/pages/games_page/game_item.dart';
import 'package:clearbook/src/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class GamesView extends StatelessWidget {
  const GamesView({
    @required this.dateTime,
    @required this.items,
    @required this.order,
  });

  final DateTime dateTime;
  final List<GameItem> items;
  final double order;

  static final _weekName = ['月', '火', '水', '木', '金', '土', '日'];

  @override
  Widget build(BuildContext context) {
    return FocusTraversalOrder(
      order: NumericFocusOrder(order),
      child: Container(
        color: MemocaColors.cardBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              dateTime.year.toString() +
                  '年' +
                  dateTime.month.toString() +
                  '月' +
                  dateTime.day.toString() +
                  '日 (${_weekName[dateTime.weekday]}) 発売',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            ...items,
          ],
        ),
      ),
    );
  }
}
