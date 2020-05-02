import 'package:clearbook/src/model/entities/entities.dart';
import 'package:clearbook/src/utils/utils.dart';
import 'package:clearbook/src/widgets/widgets.dart';
import 'package:flutter/semantics.dart';

class GameItem extends StatelessWidget {
  const GameItem({
    Key key,
    @required this.game,
  }) : super(key: key);

  final Game game;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Semantics.fromProperties(
      properties: SemanticsProperties(
        button: true,
        label: game.title,
      ),
      excludeSemantics: true,
      child: FlatButton(
        onPressed: () {},
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        alignment: FractionalOffset.center,
                        image: game.image == null
                          ? AssetImage('assets/images/no-image.png')
                          : Image.file(game.image).image,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4),
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
                            Row(
                              children: [
                                Chip(
                                  backgroundColor: game.color,
                                  padding: EdgeInsets.all(0),
                                  label: Text(
                                    game.platformAsString,
                                    style: textTheme.bodyText2,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4),
                                ),
                                Flexible(
                                  child: DefaultTextStyle(
                                    style: textTheme.bodyText2
                                        .copyWith(fontSize: 14),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    child: Text(
                                      game.title,
                                      style: textTheme.bodyText2
                                          .copyWith(fontSize: 14),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              game.priceAsString,
                              style: textTheme.bodyText2.copyWith(
                                color: MemocaColors.gray60,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
