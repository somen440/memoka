import 'package:clearbook/src/pages/projects_page/project_page/gallery/gallery_dialog.dart';
import 'package:clearbook/src/widgets/widgets.dart';

class GalleryView extends StatelessWidget {
  final fakeGalleries = [
    'https://image.shutterstock.com/z/stock-vector-seamless-pattern-of-retro-style-bit-video-game-172398551.jpg',
    'https://image.shutterstock.com/z/stock-vector-fighting-video-game-screen-770316925.jpg',
    'https://image.shutterstock.com/z/stock-vector-video-game-character-screen-fighting-video-game-choose-fighters-interface-663118321.jpg',
    'https://image.shutterstock.com/z/stock-vector-video-game-interface-design-elements-vector-background-and-different-blocks-to-construct-your-own-401664562.jpg',
    'https://image.shutterstock.com/z/stock-vector-colorful-poster-of-new-game-insert-coin-with-graphics-of-spatial-game-level-one-697315732.jpg',
    'https://image.shutterstock.com/z/stock-vector-game-over-pixel-art-design-with-city-landscape-background-colorful-pixel-arcade-screen-for-game-1105567490.jpg',
    'https://image.shutterstock.com/z/stock-vector-atlantis-ruins-playing-field-vector-illustration-screen-to-the-computer-game-bright-background-422700877.jpg',
    'https://image.shutterstock.com/z/stock-vector-retro-platformer-video-game-vector-gaming-screen-computer-pixel-game-interface-illustration-of-568559248.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallery'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        children: fakeGalleries
            .map((e) => GestureDetector(
                  onTap: () async {
                    await showDialog(
                      context: context,
                      builder: (_) => GalleryDialog(image: Image.network(e)),
                    );
                  },
                  child: Image.network(e, fit: BoxFit.cover),
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.picture_in_picture),
      ),
    );
  }
}
