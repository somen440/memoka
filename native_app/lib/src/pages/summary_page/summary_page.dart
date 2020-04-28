import 'package:clearbook/src/model/model.dart';
import 'package:clearbook/src/pages/summary_page/news_view.dart';
import 'package:clearbook/src/utils/colors.dart';
import 'package:clearbook/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final news = Provider.of<NewsState>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            NewsView(newsList: news.messages.sublist(0, 1) ?? []),
            const SizedBox(height: 12),
            _SummaryScreenGrid(spacing: 12),
          ],
        ),
      ),
    );
  }
}

class _SummaryScreenGrid extends StatelessWidget {
  const _SummaryScreenGrid({
    Key key,
    @required this.spacing,
  })  : assert(spacing != null),
        super(key: key);

  final double spacing;

  @override
  Widget build(BuildContext context) {
    final summary = Provider.of<SummaryState>(context);
    return Wrap(
      runSpacing: spacing,
      children: [
        Container(
          width: double.infinity,
          child: MemocaCard(
            title: '総プレイ時間',
            main: '77777 h',
            items: _buildItems(summary.playTimeList ?? []),
            buttonSemanticsLabel: 'すべてを表示',
            order: 1,
          ),
        ),
        Container(
          width: double.infinity,
          child: MemocaCard(
            title: 'メモ数',
            main: '123 個',
            items: _buildItems(summary.memoNumList ?? []),
            buttonSemanticsLabel: 'すべてを表示',
            order: 2,
          ),
        ),
        Container(
          width: double.infinity,
          child: MemocaCard(
            title: 'Todo 消化率',
            main: '67.8 %',
            items: _buildItems(summary.todoRateList ?? []),
            buttonSemanticsLabel: 'すべてを表示',
            order: 3,
          ),
        ),
      ],
    );
  }

  List<MemocaCardItem> _buildItems(List<Summary> summaries){
    var colorIndex = 0;
    return summaries.map((e) => MemocaCardItem(
      suffix: const Icon(Icons.chevron_right, color: Colors.grey),
      title: e.title,
      subtitle: e.subTitle,
      semanticsLabel: '${e.title} / ${e.subTitle} / ${e.result}',
      indicatorColor: MemocaColors.cycledColor(colorIndex++),
      indicatorFraction: 1,
      message: e.result,
    )).toList();
  }
}
