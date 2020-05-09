import 'package:clearbook/src/model/model.dart';
import 'package:clearbook/src/utils/colors.dart';
import 'package:clearbook/src/widgets/widgets.dart';

class TodoView extends StatelessWidget {
  final fakeTask = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Todo'),
      ),
      body: ListView(
        children: [
          ...Provider.of<TodoState>(context)
              .taskListWithNotDone
              .map((e) => ListTile(
                    leading: InkWell(
                      onTap: () {
                        Provider.of<TodoState>(
                          context,
                          listen: false,
                        ).done(e.id);
                      },
                      child: Icon(
                        Icons.check_box_outline_blank,
                        color: Colors.white,
                      ),
                    ),
                    title: InkWell(
                      onTap: () {
                        Provider.of<TodoState>(
                          context,
                          listen: false,
                        ).updateEditTaskId(e.id);
                      },
                      child: Provider.of<TodoState>(context).editTaskId == e.id
                          ? TextFormField(
                              initialValue: e.title,
                              onFieldSubmitted: (title) {
                                Provider.of<TodoState>(
                                  context,
                                  listen: false,
                                ).updateTaskTitle(
                                  e.id,
                                  title,
                                );
                              },
                            )
                          : Text(e.title),
                    ),
                  ))
              .toList(),
          Divider(
            color: MemocaColors.dividerColor,
          ),
          ListTile(
            leading: InkWell(
              onTap: () {
                Provider.of<TodoState>(
                  context,
                  listen: false,
                ).addTask('');
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            title: InkWell(
              onTap: () {
                Provider.of<TodoState>(
                  context,
                  listen: false,
                ).addTask('');
              },
              child: Opacity(
                opacity: 0.5,
                child: const Text(
                  'リストアイテム',
                ),
              ),
            ),
          ),
          Divider(
            color: Colors.white,
          ),
          ListTile(
            leading: InkWell(
              onTap: () {
                Provider.of<TodoState>(
                  context,
                  listen: false,
                ).switchTaskWithDone();
              },
              child: Icon(
                Provider.of<TodoState>(context).isShowTaskWithDone
                    ? Icons.keyboard_arrow_down
                    : Icons.keyboard_arrow_right,
                color: Colors.white,
              ),
            ),
            title: Opacity(
              opacity: 0.5,
              child: Text(
                'チェック済みアイテム ${Provider.of<TodoState>(context).taskWithDoneCount} 件',
              ),
            ),
          ),
          ...Provider.of<TodoState>(context).isShowTaskWithDone
              ? Provider.of<TodoState>(context).taskListWithDone.map(
                    (e) => Opacity(
                      opacity: 0.5,
                      child: ListTile(
                        leading: InkWell(
                          onTap: () {
                            Provider.of<TodoState>(
                              context,
                              listen: false,
                            ).notDone(e.id);
                          },
                          child: Icon(
                            Icons.check_box,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          e.title,
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    ),
                  )
              : [],
        ],
      ),
    );
  }
}
