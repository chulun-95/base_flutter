import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageHelper {
  static Widget loadFromUrl(
    String imageURL, {
    double? imageWidth,
    double? imageHeight,
    double? radius,
    BoxFit? fit = BoxFit.contain,
  }) {
    return CachedNetworkImage(
      imageUrl: imageURL,
      width: imageWidth,
      height: imageHeight,
      imageBuilder: (context, imageProvider) => Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 0),
          image: DecorationImage(
            image: imageProvider,
            fit: fit,
          ),
        ),
      ),
      placeholder: (context, url) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      errorWidget: (BuildContext context, String url, dynamic error) {
        return const Center(
          child: Icon(Icons.error),
        );
      },
    );
  }

  static Widget loadFromAsset(
    String imageFilePath, {
    String? defaultImage,
    double? width,
    double? height,
    double? radius,
    BoxFit? fit,
    Color? tintColor,
    Alignment? alignment,
  }) {
    if (imageFilePath.toLowerCase().endsWith('svg')) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: SvgPicture.asset(
          imageFilePath,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          color: tintColor,
          alignment: alignment ?? Alignment.center,
        ),
      );
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(radius ?? 0),
        child: Image.asset(
          imageFilePath,
          width: width,
          height: height,
          fit: fit ?? BoxFit.contain,
          color: tintColor,
          alignment: alignment ?? Alignment.center,
        ),
      );
    }
  }
}
