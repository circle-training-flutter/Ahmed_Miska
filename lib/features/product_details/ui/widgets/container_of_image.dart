import 'package:circletraning/core/widgets/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerOfImage extends StatelessWidget {
  final String imageUrl;
  const ContainerOfImage({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 234.h,
        width: double.infinity,
        child: CachedImage(
          image: imageUrl,
        ));
  }
}
