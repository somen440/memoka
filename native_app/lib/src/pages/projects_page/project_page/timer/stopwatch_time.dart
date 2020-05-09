import 'package:clearbook/src/model/entities/timer.dart';
import 'package:clearbook/src/widgets/widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopwatchTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: Provider.of<TimerState>(context).rawTime,
      initialData: Provider.of<TimerState>(context).value,
      builder: (context, snap) {
        final value = snap.data;
        final displayTime = StopWatchTimer.getDisplayTime(value);
        return Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                displayTime,
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Helvetica',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
