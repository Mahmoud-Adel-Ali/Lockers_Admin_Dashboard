import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

var emptyImage =
    "https://media.gettyimages.com/id/1300845620/vector/user-icon-flat-isolated-on-white-background-user-symbol-vector-illustration.jpg?s=2048x2048&w=gi&k=20&c=0bZGqY3ObazuIBsr1NOPEs8q5nSvkeH7vtrubIehv8A=";

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    super.key,
    this.imgUrl,
    this.height,
    this.width,
    this.fit = BoxFit.cover,
  });
  final String? imgUrl;
  final double? height, width;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: (imgUrl != null && imgUrl!.isNotEmpty) ? imgUrl! : emptyImage,
      height: height,
      width: width,
      fit: fit,
      errorWidget: ((context, error, stackTrace) =>
          const Icon(Icons.account_circle)),
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator(color: AppColors.main)),
    );
  }
}

DecorationImage customCachedNetworkImageprovider(
  String? imgPath, {
  BoxFit? fit,
}) {
  return DecorationImage(
    fit: fit ?? BoxFit.cover,
    image: CachedNetworkImageProvider(
      (imgPath != null && imgPath.isNotEmpty) ? imgPath : emptyImage,
    ),
    onError: (exception, stackTrace) =>
        const Icon(Icons.account_circle, color: AppColors.red),
  );
}
