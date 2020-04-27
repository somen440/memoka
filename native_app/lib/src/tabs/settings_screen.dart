import 'package:clearbook/src/common/colors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsScreen> {
  final settings = [
    // todo: 設定の精査
    // Edit summary
    //  - 並び順
    //  - 表示数
    //  - 表示/非表示の切り替え
    'Edit Summary',
    // Link with Twitter
    //  - 特定のプロジェクトとタグを紐付ける
    'Link with Twitter',
    // Initialize
    //  - キャッシュ強制削除
    //  - データ削除
    'Initialize',
    '利用規約とプライバシーポリシー',
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
