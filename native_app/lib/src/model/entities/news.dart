import 'package:clearbook/src/widgets/widgets.dart';

class NewsState with ChangeNotifier {
  NewsState() {
    fetchDummy();
  }

  List<String> _messages = [];
  List<String> get messages => _messages;

  void initializeMessages(List<String> messages) {
    _messages = messages;
    notifyListeners();
  }

  void clear() {
    _messages = [];
    notifyListeners();
  }

  void fetchDummy() {
    initializeMessages([
      'FF7 の発売日です。',
      'FF7 の発売日です。',
      'FF7 の発売日です。',
    ]);
    notifyListeners();
  }
}
