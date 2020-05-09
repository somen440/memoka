import 'package:clearbook/src/model/entities/timer.dart';
import 'package:clearbook/src/widgets/widgets.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class StopwatchLapTime extends StatelessWidget {
  const StopwatchLapTime({
    Key key,
    @required this.scrollController,
  }) : super(key: key);

  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<StopWatchRecord>>(
      stream: Provider.of<TimerState>(context).records,
      initialData: Provider.of<TimerState>(context).recordsValue,
      builder: (context, snap) {
        final value = snap.data;
        if (value.isEmpty) {
          return Container();
        }
        Future.delayed(const Duration(milliseconds: 100), () {
          scrollController.animateTo(scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut);
        });

        return ListView.builder(
          controller: scrollController,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            final data = value[index];
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    '#${index + 1} ${data.displayTime}',
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'Helvetica',
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Divider(
                  height: 1,
                )
              ],
            );
          },
          itemCount: value.length,
        );
      },
    );
  }
}
