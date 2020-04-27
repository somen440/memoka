import 'dart:math' as math;

import 'package:clearbook/src/utils/colors.dart';
import 'package:clearbook/src/utils/text_scale.dart';
import 'package:clearbook/src/widgets/card/card_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MemocaCard extends StatelessWidget {
  const MemocaCard({
    this.title,
    this.buttonSemanticsLabel,
    this.main,
    this.items,
    this.order,
  });

  final String title;
  final String buttonSemanticsLabel;
  final String main;
  final List<MemocaCardItem> items;
  final double order;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return FocusTraversalOrder(
      order: NumericFocusOrder(order),
      child: Container(
        color: MemocaColors.cardBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            MergeSemantics(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 16,
                      right: 16,
                    ),
                    child: Text(title),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      main,
                      style: theme.textTheme.bodyText1.copyWith(
                        fontSize: 44 / reducedTextScale(context),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ...items.sublist(0, math.min(items.length, 3)),
            FlatButton(
              child: Text(
                'すべてを表示',
                semanticsLabel: buttonSemanticsLabel,
              ),
              textColor: Colors.white,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

