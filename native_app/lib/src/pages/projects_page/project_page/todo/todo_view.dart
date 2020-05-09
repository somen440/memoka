import 'package:clearbook/src/utils/colors.dart';
import 'package:clearbook/src/widgets/widgets.dart';

class _Task {
  const _Task({@required this.name, @required this.done});
  final String name;
  final bool done;
}

class TodoView extends StatelessWidget {
  final fakeTask = [
    _Task(name: 'task1', done: false),
    _Task(name: 'task2', done: false),
    _Task(name: 'task3', done: false),
    _Task(name: 'task4', done: false),
    _Task(name: 'task5', done: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Task'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: fakeTask.length,
              itemBuilder: (context, int i) {
                final task = fakeTask[i];
                return Column(
                  children: [
                    ListTile(
                      title: Text(task.name),
                      leading: Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.white,
                      ),
                    ),
                    Divider(
                      height: 0,
                      color: MemocaColors.dividerColor,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
