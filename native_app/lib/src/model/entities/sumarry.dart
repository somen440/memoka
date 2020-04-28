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

class SummaryState extends ChangeNotifier {
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
}
