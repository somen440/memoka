import 'package:clearbook/src/model/entities/timer.dart';
import 'package:clearbook/src/pages/projects_page/project_page/timer/stopwatch_lap_time.dart';
import 'package:clearbook/src/pages/projects_page/project_page/timer/stopwatch_time.dart';
import 'package:clearbook/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class TimerView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: StopwatchTime(),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
            ),
            Container(
              height: Provider.of<TimerState>(context).isLapped ? 200 : 0,
              margin: const EdgeInsets.all(8),
              child: StopwatchLapTime(
                scrollController: ScrollController(),
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: Provider.of<TimerState>(context).isStop
          ? _buildStopGroup(context)
          : Provider.of<TimerState>(context).isStart
          ? _buildStartGroup(context)
          : Provider.of<TimerState>(context).isPause
          ? _buildPauseGroup(context)
          : [],
    );
  }

  List<Widget> _buildStopGroup(context) {
    return [
      _buildStartButton(context),
    ];
  }

  List<Widget> _buildStartGroup(context) {
    return [
      _buildResetButton(context),
      _buildPauseButton(context),
      _buildLapButton(context),
    ];
  }

  List<Widget> _buildPauseGroup(context) {
    return [
      _buildResetButton(context),
      _buildStartButton(context),
      _buildSaveButton(context),
    ];
  }

  Widget _buildStartButton(context) {
    return IconButton(
      icon: Icon(
        Icons.play_circle_outline,
        color: Colors.white,
      ),
      onPressed: () {
        Provider.of<TimerState>(
          context,
          listen: false,
        ).start();
      },
    );
  }

  Widget _buildPauseButton(context) {
    return IconButton(
      icon: Icon(
        Icons.pause_circle_outline,
        color: Colors.white,
      ),
      onPressed: () {
        Provider.of<TimerState>(
          context,
          listen: false,
        ).pause();
      },
    );
  }

  Widget _buildResetButton(context) {
    return FlatButton(
      onPressed: () {
        Provider.of<TimerState>(
          context,
          listen: false,
        ).reset();
      },
      child: Text(
        'リセット',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildSaveButton(context) {
    return FlatButton(
      onPressed: () {},
      child: Text(
        '保存',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildLapButton(context) {
    return FlatButton(
      onPressed: () {
        Provider.of<TimerState>(
          context,
          listen: false,
        ).lap();
      },
      child: Text(
        'ラップ',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
