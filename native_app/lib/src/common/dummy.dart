import 'package:clearbook/src/common/card.dart';
import 'package:clearbook/src/common/colors.dart';
import 'package:clearbook/src/common/data.dart';
import 'package:flutter/material.dart';

List<News> getDummyNews() {
  return [
    News(
      message: 'FF7 発売まで後 7 日です。',
      iconData: Icons.sort,
    ),
    News(
      message: 'FF7 発売されました',
      iconData: Icons.sort,
    ),
    News(
      message: '新しい FF7 がシェアされました',
      iconData: Icons.sort,
    ),
  ];
}

List<CardViewItem> getDummyPlayTimesCards() {
  return [
    CardViewItem(
      suffix: const Icon(Icons.chevron_right, color: Colors.grey),
      title: 'FF1',
      subtitle: '2019/1/1',
      semanticsLabel: 'sema',
      indicatorColor: MemocaColors.cycledColor(0),
      indicatorFraction: 1,
      message: '10h',
    ),
    CardViewItem(
      suffix: const Icon(Icons.chevron_right, color: Colors.grey),
      title: 'FF2',
      subtitle: '2019/1/2',
      semanticsLabel: 'sema',
      indicatorColor: MemocaColors.cycledColor(1),
      indicatorFraction: 1,
      message: '20h',
    ),
    CardViewItem(
      suffix: const Icon(Icons.chevron_right, color: Colors.grey),
      title: 'FF3',
      subtitle: '2019/1/3',
      semanticsLabel: 'sema',
      indicatorColor: MemocaColors.cycledColor(2),
      indicatorFraction: 1,
      message: '30h',
    ),
  ];
}
