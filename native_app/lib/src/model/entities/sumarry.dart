import 'package:clearbook/src/widgets/widgets.dart';

class Summary {
  const Summary({
    this.title,
    this.subTitle,
    this.result,
  });

  final String title;
  final String subTitle;
  final String result;
}

class SummaryState with ChangeNotifier {
  SummaryState() {
    fetchDummy();
  }

  List<Summary> _playTimeList;
  List<Summary> _todoRateList;
  List<Summary> _memoNumList;

  List<Summary> get playTimeList => _playTimeList;
  List<Summary> get todoRateList => _todoRateList;
  List<Summary> get memoNumList => _memoNumList;

  void initialize(
    List<Summary> playTimeList,
    List<Summary> todoRateList,
    List<Summary> memoNumList,
  ) {
    _playTimeList = playTimeList;
    _todoRateList = todoRateList;
    _memoNumList = memoNumList;
    notifyListeners();
  }

  void clear() {
    _playTimeList = [];
    _todoRateList = [];
    _memoNumList = [];
    notifyListeners();
  }

  void fetchDummy() {
    final playTimeList = [
      Summary(
        title: 'FF1',
        subTitle: '2019/01/01',
        result: '11.1 h',
      ),
      Summary(
        title: 'FF2',
        subTitle: '2019/02/02',
        result: '22.2 h',
      ),
      Summary(
        title: 'FF3',
        subTitle: '2019/03/03',
        result: '33.3 h',
      ),
    ];
    final todoRateList = [
      Summary(
        title: 'FF1',
        subTitle: '2019/01/01',
        result: '11.1 %',
      ),
      Summary(
        title: 'FF2',
        subTitle: '2019/02/02',
        result: '22.2 %',
      ),
      Summary(
        title: 'FF3',
        subTitle: '2019/03/03',
        result: '33.3 %',
      ),
    ];
    final memoNumList = [
      Summary(
        title: 'FF1',
        subTitle: '2019/01/01',
        result: '11 個',
      ),
      Summary(
        title: 'FF2',
        subTitle: '2019/02/02',
        result: '22 個',
      ),
      Summary(
        title: 'FF3',
        subTitle: '2019/03/03',
        result: '33 個',
      ),
    ];
    initialize(playTimeList, todoRateList, memoNumList);
    notifyListeners();
  }
}
