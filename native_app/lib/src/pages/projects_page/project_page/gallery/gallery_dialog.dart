import 'package:clearbook/src/widgets/widgets.dart';

class GalleryDialog extends StatelessWidget {
  const GalleryDialog({
    Key key,
    @required this.image,
  }) : super(key: key);

  final Image image;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: 300,
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(image: image.image),
        ),
      ),
    );
  }
}
