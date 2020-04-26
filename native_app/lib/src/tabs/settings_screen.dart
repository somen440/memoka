import 'package:clearbook/src/data/colors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsScreen> {
  final settings = [
    // todo: 設定の精査
    '通知',
    '連携',
    'データ管理',
    '初期化',
    '利用規約',
  ];

  @override
  Widget build(BuildContext context) {
    return FocusTraversalGroup(
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            for (String title in settings) ...[
              _SettingsItem(title),
              const Divider(
                color: MemocaColors.dividerColor,
                height: 1,
              )
            ]
          ],
        ),
      ),
    );
  }
}

class _SettingsItem extends StatelessWidget {
  const _SettingsItem(this.title);

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
