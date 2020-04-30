import 'package:clearbook/src/model/entities/entities.dart';
import 'package:clearbook/src/pages/games_page/add_games_form.dart';
import 'package:clearbook/src/pages/games_page/game_item.dart';
import 'package:clearbook/src/pages/games_page/games_view.dart';
import 'package:clearbook/src/utils/utils.dart';
import 'package:clearbook/src/widgets/widgets.dart';

class GamesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<GamesView> gamesViewList = [];

    double order = 0;
    Provider.of<GameListState>(context)
        .gameListGroupedByReleaseDate
        .forEach((key, value) {
          gamesViewList.add(GamesView(
              dateTime: key,
              items: value.map((e) => GameItem(game: e)).toList(),
              order: order++,
          ));
    });

    return Scaffold(
      body: FocusTraversalOrder(
          order: NumericFocusOrder(0),
          child: Container(
              color: MemocaColors.cardBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(padding: EdgeInsets.all(8)),
                  ...gamesViewList,
                ],
              ))),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => AddGamesForm(),
            ));
          },
        child: Icon(Icons.add),
        backgroundColor: MemocaColors.etc,
      ),
    );
  }
}
