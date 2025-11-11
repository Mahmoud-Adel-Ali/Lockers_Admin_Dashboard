import 'package:flutter/material.dart';

import '../widgets/custom_progress_hub.dart';

Future<dynamic> showLoadingDialog(BuildContext context) {
  return showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => Center(child: LoadingIconWidget()),
  );
}
