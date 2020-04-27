import 'package:clearbook/src/widgets/widgets.dart';

class NewsState extends ChangeNotifier {
  List<String> _messages = [];

  List<String> get messages => _messages;

  void initializeMessages(List<String> messages) {
    _messages = messages;
    notifyListeners();
  }
}
