import 'package:clearbook/src/pages/settings_page/settings_item.dart';
import 'package:clearbook/src/utils/colors.dart';
import 'package:clearbook/src/widgets/widgets.dart';

class SettingsPage extends StatelessWidget {
  final settings = [
    // todo: 設定の精査
    // Edit summary
    //  - 並び順
    //  - 表示数
    //  - 表示/非表示の切り替え
    '概要ウィジェット編集',
    // Link with Twitter
    //  - 特定のプロジェクトとタグを紐付ける
    'Twitter連携',
    // Initialize
    //  - キャッシュ強制削除
    //  - データ削除
    '初期化',
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
              SettingsItem(title),
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
