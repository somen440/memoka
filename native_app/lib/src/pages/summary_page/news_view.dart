import 'package:clearbook/src/utils/utils.dart';
import 'package:clearbook/src/widgets/widgets.dart';

class NewsView extends StatelessWidget {
  const NewsView({
    Key key,
    @required this.newsList,
  })  : assert(newsList != null),
        super(key: key);

  final List<String> newsList;

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
          for (String message in newsList) ...[
            Container(color: MemocaColors.primaryBackground, height: 1),
            _NewsItem(message: message),
          ],
        ],
      ),
    );
  }
}

class _NewsItem extends StatelessWidget {
  const _NewsItem({
    Key key,
    @required this.message,
  })  : assert(message != null),
        super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return MergeSemantics(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(message),
            ),
            SizedBox(
              width: 100,
              child: Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.sort,
                    color: MemocaColors.white60,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
