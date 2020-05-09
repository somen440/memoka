import 'package:clearbook/src/widgets/widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';
import 'package:rxdart/rxdart.dart';

enum _State {
  Stop,
  Start,
  Pause,
}

class TimerState with ChangeNotifier {
  TimerState() {
    initialize();
  }

  StopWatchTimer _stopWatchTimer;
  ValueStream<int> get rawTime => _stopWatchTimer.rawTime;
  int get value => _stopWatchTimer.rawTime.value;
  ValueStream<List<StopWatchRecord>> get records => _stopWatchTimer.records;
  List<StopWatchRecord> get recordsValue => _stopWatchTimer.records.value;

  _State _currentState;
  bool get isStop => _currentState == _State.Stop;
  bool get isStart => _currentState == _State.Start;
  bool get isPause => _currentState == _State.Pause;

  bool _isLapped;
  bool get isLapped => _isLapped;

  void start() {
    _currentState = _State.Start;
    _stopWatchTimer.onExecute.add(StopWatchExecute.start);
    notifyListeners();
  }

  void lap() {
    _isLapped = true;
    _stopWatchTimer.onExecute.add(StopWatchExecute.lap);
    notifyListeners();
  }

  void pause() {
    _currentState = _State.Pause;
    _stopWatchTimer.onExecute.add(StopWatchExecute.stop);
    notifyListeners();
  }

  void reset() {
    _currentState = _State.Stop;
    _isLapped = false;
    _stopWatchTimer.onExecute.add(StopWatchExecute.reset);
    notifyListeners();
  }

  void initialize() {
    _currentState = _State.Stop;
    _isLapped = false;
    _stopWatchTimer = StopWatchTimer();
    notifyListeners();
  }

  @override
  void dispose() {
    _stopWatchTimer.dispose();
    super.dispose();
  }
}
