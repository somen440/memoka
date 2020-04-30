import 'package:clearbook/src/model/entities/entities.dart';
import 'package:clearbook/src/pages/games_page/games_page.dart';
import 'package:clearbook/src/pages/page.dart';
import 'package:clearbook/src/utils/utils.dart';
import 'package:clearbook/src/widgets/widgets.dart';
import 'package:provider/provider.dart';

class MemocaApp extends StatefulWidget {
  const MemocaApp();

  @override
  _MemocaAppState createState() => _MemocaAppState();
}

class _MemocaAppState extends State<MemocaApp>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: Const.tabCount, vsync: this)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = _buildMemocaTheme();
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsState()),
        ChangeNotifierProvider(create: (_) => SummaryState()),
        ChangeNotifierProvider(create: (_) => GameListState()),
        ChangeNotifierProvider(create: (_) => AddGameFormState()),
      ],
      child: MaterialApp(
        title: 'Memoca',
        debugShowCheckedModeBanner: false,
        theme: theme,
        home: Scaffold(
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
                child: Column(
                  children: [
                    MemocaTabBar(
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildTabs({BuildContext context, ThemeData theme}) {
    var tabIndex = 0;
    return [
      MemocaTab(
        theme: theme,
        iconData: Icons.equalizer,
        title: 'Summary',
        tabIndex: tabIndex++,
        tabController: _tabController,
      ),
      MemocaTab(
        theme: theme,
        iconData: Icons.games,
        title: 'Projects',
        tabIndex: tabIndex++,
        tabController: _tabController,
      ),
      MemocaTab(
        theme: theme,
        iconData: Icons.list,
        title: 'Games',
        tabIndex: tabIndex++,
        tabController: _tabController,
      ),
      MemocaTab(
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
      SummaryPage(),
      Container(),
      GamesPage(),
      SettingsPage(),
    ];
  }

  ThemeData _buildMemocaTheme() {
    final base = ThemeData.dark();
    return ThemeData(
      scaffoldBackgroundColor: MemocaColors.primaryBackground,
      primaryColor: MemocaColors.primaryBackground,
      focusColor: MemocaColors.focusColor,
      textTheme: _buildMemocaTextTheme(base.textTheme),
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: MemocaColors.gray,
          fontWeight: FontWeight.w500,
        ),
        filled: true,
        fillColor: MemocaColors.inputBackground,
        focusedBorder: InputBorder.none,
      ),
    );
  }

  TextTheme _buildMemocaTextTheme(TextTheme base) {
    return base
        .copyWith(
          bodyText2: GoogleFonts.robotoCondensed(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.5,
          ),
          bodyText1: GoogleFonts.eczar(
            fontSize: 40,
            fontWeight: FontWeight.w400,
            letterSpacing: 1.4,
          ),
          button: GoogleFonts.robotoCondensed(
            fontWeight: FontWeight.w700,
            letterSpacing: 2.8,
          ),
          headline5: GoogleFonts.eczar(
            fontSize: 40,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.4,
          ),
        )
        .apply(
          displayColor: Colors.white,
          bodyColor: Colors.white,
        );
  }
}
