import 'package:clearbook/src/utils/utils.dart';
import 'package:collection/collection.dart';
import 'package:clearbook/src/widgets/widgets.dart';

enum _Platform {
  iOS,
  Android,
  Switch,
  PS4,
  Xbox,
  Etc,
}

class Game {
  const Game({
    this.title,
    this.platform,
    this.price,
    this.image,
    this.releaseDate,
  });

  final String title;
  final _Platform platform;
  final int price;
  final String image;
  final DateTime releaseDate;

  String get priceAsString => "¥ " + price.toString() + " 円";

  Color get color => _Platform.PS4 == platform
      ? MemocaColors.ps4
      : _Platform.Xbox == platform
          ? MemocaColors.xbox
          : _Platform.Switch == platform
              ? MemocaColors.sw
              : _Platform.iOS == platform
                  ? MemocaColors.ios
                  : _Platform.Android == platform
                      ? MemocaColors.android
                      : MemocaColors.etc;

  String get platformAsString => platform.toString().split('.')[1];

  static List<String> get platforms =>
      _Platform.values.map((e) => e.toString().split('.')[1]).toList();
}

class GameListState with ChangeNotifier {
  GameListState() {
    fetchDummy();
  }

  List<Game> _gameList = [];
  List<Game> get gameList => _gameList;
  Map<DateTime, List<Game>> get gameListGroupedByReleaseDate => groupBy(
        _gameList,
        (Game obj) => obj.releaseDate,
      );

  void fetchDummy() {
    _gameList = [
      Game(
        title: 'Moving Out',
        platform: _Platform.Switch,
        price: 4280,
        image:
            'https://cache.famitsu.com/review/title/0000/0000/0011/4735/jacket/m.jpg',
        releaseDate: DateTime(2020, 4, 29),
      ),
      Game(
        title: '聖剣伝説3 トライアルズ オブ マナ',
        platform: _Platform.Switch,
        price: 5980,
        image:
            'https://cache.famitsu.com/review/title/0000/0000/0011/2293/jacket/m.jpg',
        releaseDate: DateTime(2020, 4, 24),
      ),
      Game(
        title: 'PREDATOR HUNTING GROUNDS（プレデター ハンティング グラウンズ）',
        platform: _Platform.PS4,
        price: 4900,
        image:
            'https://cache.famitsu.com/review/title/0000/0000/0011/4326/jacket/m.jpg',
        releaseDate: DateTime(2020, 4, 24),
      ),
    ];
    notifyListeners();
  }
}

class AddGameFormState with ChangeNotifier {
  AddGameFormState() {
    initialize();
  }

  String _selectedPlatform;
  String get selectedPlatform => _selectedPlatform;

  void updateSelectedPlatform(String platform) {
    _selectedPlatform = platform;
  }

  void initialize() {
    _selectedPlatform = 'Android';
  }
}
