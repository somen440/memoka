import 'package:clearbook/src/tabs/game_screen.dart';
import 'package:clearbook/src/tabs/list_screen.dart';
import 'package:clearbook/src/tabs/settings_screen.dart';
import 'package:clearbook/src/tabs/summary_screen.dart';
import 'package:clearbook/src/tabs/work_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const tabCount = 5;

class HomePage extends StatefulWidget {
  const HomePage();

  @override
  _HomePageStage createState() => _HomePageStage();
}

class _HomePageStage extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabCount, vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<Widget> _buildTabs({BuildContext context, ThemeData theme}) {
    var tabIndex = 0;
    return [
      _MemocaTab(
        theme: theme,
        iconData: Icons.equalizer,
        title: 'Summary',
        tabIndex: tabIndex++,
        tabController: _tabController,
      ),
      _MemocaTab(
        theme: theme,
        iconData: Icons.games,
        title: 'Projects',
        tabIndex: tabIndex++,
        tabController: _tabController,
      ),
      _MemocaTab(
        theme: theme,
        iconData: Icons.list,
        title: 'Games',
        tabIndex: tabIndex++,
        tabController: _tabController,
      ),
      _MemocaTab(
        theme: theme,
        iconData: Icons.group_work,
        title: 'Work',
        tabIndex: tabIndex++,
        tabController: _tabController,
      ),
      _MemocaTab(
        theme: theme,
        iconData: Icons.settings,
        title: 'Settings',
        tabIndex: tabIndex++,
        tabController: _tabController,
      ),
    ];
  }

  List<Widget> _buildTabViews() {
    return [
      SummaryScreen(),
      GameScreen(),
      ListScreen(),
      WorkScreen(),
      SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final tabBarView = Column(
      children: [
        _MemocaTabBar(
          tabs: _buildTabs(context: context, theme: theme),
          tabController: _tabController,
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: _buildTabViews(),
          ),
        ),
      ],
    );
    return Scaffold(
      body: SafeArea(
        top: true,
        bottom: true,
        child: Theme(
          data: theme.copyWith(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
          ),
          child: FocusTraversalGroup(
            policy: OrderedTraversalPolicy(),
            child: tabBarView,
          ),
        ),
      ),
    );
  }
}

class _MemocaTabBar extends StatelessWidget {
  const _MemocaTabBar({Key key, this.tabs, this.tabController})
      : super(key: key);

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

class _MemocaTab extends StatefulWidget {
  _MemocaTab({
    ThemeData theme,
    IconData iconData,
    String title,
    int tabIndex,
    TabController tabController,
  })  : titleText = Text(title, style: theme.textTheme.button),
        isExpanded = tabController.index == tabIndex,
        icon = Icon(iconData, semanticLabel: title);

  final Text titleText;
  final Icon icon;
  final bool isExpanded;

  @override
  _MemocaTabState createState() => _MemocaTabState();
}

class _MemocaTabState extends State<_MemocaTab>
    with SingleTickerProviderStateMixin {
  Animation<double> _titleSizeAnimation;
  Animation<double> _titleFadeAnimation;
  Animation<double> _iconFadeAnimation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _titleSizeAnimation = _controller.view;
    _titleFadeAnimation = _controller.drive(CurveTween(curve: Curves.easeOut));
    _iconFadeAnimation = _controller.drive(Tween<double>(begin: 0.6, end: 1));
    if (widget.isExpanded) {
      _controller.value = 1;
    }
  }

  @override
  void didUpdateWidget(_MemocaTab oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.isExpanded) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final expandedTitleWidthMultiplier = 2;
    final unitWidth = width / (tabCount + expandedTitleWidthMultiplier);

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 56),
      child: Row(
        children: [
          FadeTransition(
            child: SizedBox(
              width: unitWidth,
              child: widget.icon,
            ),
            opacity: _iconFadeAnimation,
          ),
          FadeTransition(
            child: SizeTransition(
              child: SizedBox(
                width: unitWidth * expandedTitleWidthMultiplier,
                child: Center(
                  child: ExcludeSemantics(child: widget.titleText),
                ),
              ),
              axis: Axis.horizontal,
              axisAlignment: -1,
              sizeFactor: _titleSizeAnimation,
            ),
            opacity: _titleFadeAnimation,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
