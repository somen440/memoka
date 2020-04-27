import 'package:clearbook/src/widgets/widgets.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      textColor: Colors.white,
      child: Container(
        alignment: AlignmentDirectional.centerStart,
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
        child: Text(title),
      ),
      onPressed: () {
        // todo: Navigator.of(context).push...
      },
    );
  }
}
