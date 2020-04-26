import 'package:clearbook/src/common/card.dart';
import 'package:clearbook/src/common/colors.dart';
import 'package:clearbook/src/common/data.dart';
import 'package:clearbook/src/common/dummy.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SummaryScreen extends StatefulWidget {
  @override
  _SummaryScreenState createState() => _SummaryScreenState();
}

class _SummaryScreenState extends State<SummaryScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            _NewsListView(newsList: getDummyNews()),
            const SizedBox(height: 12),
            const _SummaryScreenGrid(spacing: 12),
          ],
        ),
      ),
    );
  }
}

class _SummaryScreenGrid extends StatelessWidget {
  const _SummaryScreenGrid({Key key, @required this.spacing}) : super(key: key);

  final double spacing;

  @override
  Widget build(BuildContext context) {
    final minWidthForTwoColumns = 600;

    return Wrap(
      runSpacing: spacing,
      children: [
        Container(
          width: double.infinity,
          child: CardView(
            title: '総プレイ時間',
            main: '77777 h',
            items: getDummyPlayTimesCards(),
            buttonSemanticsLabel: 'すべてを表示',
            order: 1,
          ),
        ),
        Container(
          width: double.infinity,
          child: CardView(
            title: 'Todo消化率',
            main: '67.8 %',
            items: getDummyPlayTimesCards(),
            buttonSemanticsLabel: 'すべてを表示',
            order: 1,
          ),
        ),
      ],
    );
  }
}

class _NewsListView extends StatelessWidget {
  const _NewsListView({Key key, this.newsList}) : super(key: key);

  final List<News> newsList;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(start: 16, top: 4, bottom: 4),
      color: MemocaColors.cardBackground,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: MergeSemantics(
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Text('News'),
                  FlatButton(
                    onPressed: () {},
                    child: Text('すべて表示する'),
                    textColor: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          for (News news in newsList) ...[
            Container(color: MemocaColors.primaryBackground, height: 1),
            _News(news: news),
          ],
        ],
      ),
    );
  }
}

class _News extends StatelessWidget {
  const _News({Key key, @required this.news}) : super(key: key);

  final News news;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(news.message),
            ),
            SizedBox(
              width: 100,
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(news.iconData, color: MemocaColors.white60),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
