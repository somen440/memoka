import 'package:clearbook/src/utils/utils.dart';
import 'package:clearbook/src/widgets/widgets.dart';
import 'package:flutter/semantics.dart';

class MemocaCardItem extends StatelessWidget {
  const MemocaCardItem({
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
