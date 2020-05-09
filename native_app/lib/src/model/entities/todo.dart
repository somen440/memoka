import 'package:clearbook/src/widgets/widgets.dart';

class _Task {
  const _Task({
    @required this.id,
    @required this.title,
    @required this.done,
  });
  final int id;
  final String title;
  final bool done;
}

class TodoState with ChangeNotifier {
  TodoState() {
    initialize();
  }

  initialize() {
    fetchDummyTaskList();
  }

  List<_Task> _taskList;
  List<_Task> get taskListWithNotDone => _taskList
      .where(
        (e) => !e.done,
      )
      .toList();
  List<_Task> get taskListWithDone => _taskList
      .where(
        (e) => e.done,
      )
      .toList();
  int get taskWithDoneCount => _taskList
      .where(
        (e) => e.done,
      )
      .length;

  void fetchDummyTaskList() {
    _taskList = [
      _Task(id: 1, title: 'task1', done: false),
      _Task(id: 2, title: 'task2', done: false),
      _Task(id: 3, title: 'task3', done: true),
      _Task(id: 4, title: 'task4', done: false),
      _Task(id: 5, title: 'task5', done: true),
    ];
    notifyListeners();
  }

  void done(int id) {
    _changeDone(id, true);
    notifyListeners();
  }

  void notDone(int id) {
    _changeDone(id, false);
    notifyListeners();
  }

  void _changeDone(int id, bool done) {
    _taskList = _taskList.map((e) {
      if (e.id == id) {
        return _Task(
          id: e.id,
          title: e.title,
          done: done,
        );
      }
      return e;
    }).toList();
  }

  bool _isShowTaskWithDone = true;
  bool get isShowTaskWithDone => _isShowTaskWithDone;

  void switchTaskWithDone() {
    _isShowTaskWithDone = !_isShowTaskWithDone;
    notifyListeners();
  }
}
