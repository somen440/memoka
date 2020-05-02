import 'dart:async';
import 'dart:io';

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
    @required this.title,
    @required this.platform,
    @required this.price,
    @required this.image,
    @required this.releaseDate,
  });

  final String title;
  final _Platform platform;
  final int price;
  final File image;
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

  static _Platform asPlatform(String platform) {
    switch (platform) {
      case "Android":
        return _Platform.Android;
      case "iOS":
        return _Platform.iOS;
      case "Switch":
        return _Platform.Switch;
      case "PS4":
        return _Platform.PS4;
      case "Xbox":
        return _Platform.Xbox;
    }
    return _Platform.Etc;
  }
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

  void addGame(Game game) {
    _gameList.add(game);
    notifyListeners();
  }

  void fetchDummy() {
    _gameList = [
      Game(
        title: 'Moving Out',
        platform: _Platform.Switch,
        price: 4280,
        image: null,
        releaseDate: DateTime(2020, 4, 29),
      ),
      Game(
        title: '聖剣伝説3 トライアルズ オブ マナ',
        platform: _Platform.Switch,
        price: 5980,
        image: null,
        releaseDate: DateTime(2020, 4, 24),
      ),
      Game(
        title: 'PREDATOR HUNTING GROUNDS（プレデター ハンティング グラウンズ）',
        platform: _Platform.PS4,
        price: 4900,
        image: null,
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

  String _title;
  String get title => _title;

  int _price;
  int get price => _price;

  String _selectedPlatform;
  String get selectedPlatform => _selectedPlatform;

  DateTime _releaseDate;
  DateTime get releaseDate => _releaseDate;

  File _image;
  File get image => _image;

  void updateTitle(String title) {
    _title = title;
    notifyListeners();
  }

  void updatePrice(int price) {
    _price = price;
    notifyListeners();
  }

  void updateSelectedPlatform(String platform) {
    _selectedPlatform = platform;
    notifyListeners();
  }

  void updateReleaseDate(DateTime releaseDate) {
    _releaseDate = releaseDate;
    notifyListeners();
  }

  void updateImage(File image) {
    _image = image;
    notifyListeners();
  }

  Game toGame() {
    return Game(
      title: _title,
      platform: Game.asPlatform(_selectedPlatform),
      price: _price,
      image: _image,
      releaseDate: DateTime(
        _releaseDate.year,
        _releaseDate.month,
        _releaseDate.day,
      ),
    );
  }

  void initialize() {
    _title = '';
    _price = 0;
    _selectedPlatform = 'Etc';
    _releaseDate = DateTime.now();
    _image = null;
    notifyListeners();
  }
}
