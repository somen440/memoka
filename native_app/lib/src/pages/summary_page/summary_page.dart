import 'package:clearbook/src/model/model.dart';
import 'package:clearbook/src/pages/summary_page/news_view.dart';
import 'package:clearbook/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class SummaryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          children: [
            Consumer<NewsState>(
              builder: (context, news, _) {
                return NewsView(newsList: news.messages.sublist(0, 1));
              },
            ),
            const SizedBox(height: 12),
            Container(),
          ],
        ),
      ),
    );
  }
}
//
//class _SummaryScreenGrid extends StatelessWidget {
//  const _SummaryScreenGrid({Key key, @required this.spacing}) : super(key: key);
//
//  final double spacing;
//
//  @override
//  Widget build(BuildContext context) {
//    return Wrap(
//      runSpacing: spacing,
//      children: [
//        Container(
//          width: double.infinity,
//          child: MemocaCard(
//            title: '総プレイ時間',
//            main: '77777 h',
//            items: [],
//            buttonSemanticsLabel: 'すべてを表示',
//            order: 1,
//          ),
//        ),
//        Container(
//          width: double.infinity,
//          child: MemocaCard(
//            title: 'メモ数',
//            main: '133 個',
//            items: [],
//            buttonSemanticsLabel: 'すべてを表示',
//            order: 2,
//          ),
//        ),
//        Container(
//          width: double.infinity,
//          child: MemocaCard(
//            title: 'Todo消化率',
//            main: '67.8 %',
//            items: [],
//            buttonSemanticsLabel: 'すべてを表示',
//            order: 3,
//          ),
//        ),
//      ],
//    );
//  }
//}
//
