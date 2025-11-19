import 'package:flutter/foundation.dart';

class PickedImage {
  final Uint8List bytes;
  final String fileName;

  PickedImage({
    required this.bytes,
    required this.fileName,
  });
}
