import 'package:clearbook/src/pages/projects_page/project_page/project_page.dart';
import 'package:clearbook/src/widgets/widgets.dart';

class ProjectsPage extends StatelessWidget {
  final gameList = [
    'ff1',
    'ff2',
    'ff3',
    'ff4',
    'ff5',
    'ff6',
    'ff7',
    'ff8',
    'ff9',
    'ff10',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: gameList
            .map((e) => _buildGameListItem(
                  context,
                  e,
                ))
            .toList(),
      ),
    );
  }

  Widget _buildGameListItem(BuildContext context, String title) {
    return FlatButton(
      textColor: Colors.white,
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Text(title),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProjectPage()),
        );
      },
    );
  }
}
