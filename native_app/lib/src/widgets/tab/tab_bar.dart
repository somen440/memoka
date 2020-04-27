import 'package:flutter/material.dart';

class MemocaTabBar extends StatelessWidget {
  const MemocaTabBar({
    Key key,
    this.tabs,
    this.tabController,
  })  : assert(tabs != null),
        assert(tabController != null),
        super(key: key);

  final List<Widget> tabs;
  final TabController tabController;

  @override
  Widget build(BuildContext context) {
    return FocusTraversalOrder(
      order: const NumericFocusOrder(0),
      child: TabBar(
        isScrollable: true,
        labelPadding: EdgeInsets.zero,
        tabs: tabs,
        controller: tabController,
        indicatorColor: Colors.transparent,
      ),
    );
  }
}
