import 'package:clearbook/src/pages/projects_page/project_page/gallery/gallery_view.dart';
import 'package:clearbook/src/pages/projects_page/project_page/memo/memo_view.dart';
import 'package:clearbook/src/pages/projects_page/project_page/timer/timer_view.dart';
import 'package:clearbook/src/pages/projects_page/project_page/todo/todo_view.dart';
import 'package:clearbook/src/widgets/widgets.dart';

class _ProjectMenu {
  const _ProjectMenu({
    @required this.title,
    @required this.builder,
  });

  final String title;
  final WidgetBuilder builder;
}

class ProjectPage extends StatelessWidget {
  final List<_ProjectMenu> menuList = [
    _ProjectMenu(title: 'Memo', builder: (context) => MemoView()),
    _ProjectMenu(title: 'Timer', builder: (context) => TimerView()),
    _ProjectMenu(title: 'Todo', builder: (context) => TodoView()),
    _ProjectMenu(title: 'Gallery', builder: (context) => GalleryView()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: menuList.map((e) => _buildButton(context, e)).toList(),
      ),
    );
  }

  Widget _buildButton(context, _ProjectMenu menu) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: menu.builder),
        );
      },
      child: Text(
        menu.title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
