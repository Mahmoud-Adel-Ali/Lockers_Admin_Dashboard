//
/// Picks an image from the given [source] (gallery or camera).
/// Returns the selected [XFile], or `null` if the user cancels.
library;

import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

import '../models/picked_image_model.dart';

// Future<PickedImage?> pickImage() async {
Future<PickedImage?> pickImageUniversal() async {
  try {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.image,
      allowMultiple: false,
      withData: true, // IMPORTANT: Needed for Web
    );

    if (result == null) return null;

    final file = result.files.first;

    return PickedImage(bytes: file.bytes!, fileName: file.name);
  } catch (e) {
    log("Pick image error: $e");
    return null;
  }
}
