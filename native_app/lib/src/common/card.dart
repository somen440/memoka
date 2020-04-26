import 'dart:math' as math;

import 'package:clearbook/src/charts/vertical_fraction_bar.dart';
import 'package:clearbook/src/common/colors.dart';
import 'package:clearbook/src/layout/text_scale.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CardView extends StatelessWidget {
  const CardView({
    this.title,
    this.buttonSemanticsLabel,
    this.main,
    this.items,
    this.order,
  });

  final String title;
  final String buttonSemanticsLabel;
  final String main;
  final List<CardViewItem> items;
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

class CardViewItem extends StatelessWidget {
  const CardViewItem({
    @required this.indicatorColor,
    @required this.indicatorFraction,
    @required this.title,
    @required this.subtitle,
    @required this.semanticsLabel,
    @required this.message,
    @required this.suffix,
  });

  final Color indicatorColor;
  final double indicatorFraction;
  final String title;
  final String subtitle;
  final String semanticsLabel;
  final String message;
  final Widget suffix;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Semantics.fromProperties(
      properties: SemanticsProperties(
        button: true,
        label: semanticsLabel,
      ),
      excludeSemantics: true,
      child: FlatButton(
        onPressed: () {},
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 32.0 + 60.0 * (cappedTextScale(context) - 1),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: VerticalFractionBar(
                      color: indicatorColor,
                      fraction: indicatorFraction,
                    ),
                  ),
                  Expanded(
                    child: Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: textTheme.bodyText2.copyWith(fontSize: 16),
                            ),
                            Text(
                              subtitle,
                              style: textTheme.bodyText2
                                  .copyWith(color: MemocaColors.gray60),
                            ),
                          ],
                        ),
                        Text(
                          message,
                          style: textTheme.bodyText1.copyWith(
                            fontSize: 20,
                            color: MemocaColors.gray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    constraints: const BoxConstraints(minWidth: 32),
                    padding: const EdgeInsetsDirectional.only(start: 12),
                    child: suffix,
                  ),
                ],
              ),
            ),
            const Divider(
              height: 1,
              indent: 16,
              endIndent: 16,
              color: MemocaColors.dividerColor,
            ),
          ],
        ),
      ),
    );
  }
}
