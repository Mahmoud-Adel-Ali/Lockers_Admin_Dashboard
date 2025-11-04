//
import 'package:image_picker/image_picker.dart';

/// Picks an image from the given [source] (gallery or camera).
/// Returns the selected [XFile], or `null` if the user cancels.
Future<XFile?> pickImage({
  ImageSource source = ImageSource.gallery,
  int imageQuality = 80, // 0-100 (optional compression)
  double? maxWidth,
  double? maxHeight,
}) async {
  final ImagePicker picker = ImagePicker();

  try {
    final XFile? image = await picker.pickImage(
      source: source,
      imageQuality: imageQuality,
      maxWidth: maxWidth,
      maxHeight: maxHeight,
    );

    if (image == null) {
      return null;
    }
    return image;
  } catch (e) {
    return null;
  }
}
