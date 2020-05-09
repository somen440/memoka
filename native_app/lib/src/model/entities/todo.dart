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

  Map<int, _Task> _taskList;
  List<_Task> get taskListWithNotDone => _taskList.values
      .where(
        (e) => !e.done,
      )
      .toList();
  List<_Task> get taskListWithDone => _taskList.values
      .where(
        (e) => e.done,
      )
      .toList();
  int get taskWithDoneCount => _taskList.values
      .where(
        (e) => e.done,
      )
      .length;

  void fetchDummyTaskList() {
    _taskList = {
      1: _Task(id: 1, title: 'task1', done: false),
      2: _Task(id: 2, title: 'task2', done: false),
      3: _Task(id: 3, title: 'task3', done: true),
      4: _Task(id: 4, title: 'task4', done: false),
      5: _Task(id: 5, title: 'task5', done: true),
    };
    notifyListeners();
  }

  void addTask(String title) {
    final newId = _taskList.length + 1;
    _taskList[newId] = _Task(
      id: newId,
      title: title,
      done: false,
    );
    updateEditTaskId(newId);
    notifyListeners();
  }

  void done(int id) {
    _taskList.update(
      id,
      (value) => _Task(
        id: value.id,
        title: value.title,
        done: true,
      ),
    );
    _clearEditTaskId();
    notifyListeners();
  }

  void notDone(int id) {
    _taskList.update(
      id,
      (value) => _Task(
        id: value.id,
        title: value.title,
        done: false,
      ),
    );
    _clearEditTaskId();
    notifyListeners();
  }

  void updateTaskTitle(int id, String title) {
    _taskList.update(
      id,
      (value) => _Task(
        id: value.id,
        title: title,
        done: value.done,
      ),
    );
    _clearEditTaskId();
    notifyListeners();
  }

  bool _isShowTaskWithDone = true;
  bool get isShowTaskWithDone => _isShowTaskWithDone;

  void switchTaskWithDone() {
    _isShowTaskWithDone = !_isShowTaskWithDone;
    _clearEditTaskId();
    notifyListeners();
  }

  int _editTaskId = 0;
  int get editTaskId => _editTaskId;

  void _clearEditTaskId() {
    _editTaskId = 0;
  }

  void updateEditTaskId(int id) {
    _editTaskId = id;
    notifyListeners();
  }
}
