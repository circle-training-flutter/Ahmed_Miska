import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/data/providers/add_and_remove_favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../helpers/consatants.dart';
import '../theming/colors.dart';

class HeartIcon extends StatefulWidget {
  final bool? checked;
 final void Function()? onTap;
  
  const HeartIcon({
    super.key,
    this.checked, this.onTap,
  });

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AddAndRemoveFavoritesProvider>(
      builder: (context,provider,child) {
        return GestureDetector(
          onTap: widget.onTap,
          child: Container(
            decoration: BoxDecoration(
              color: ColorManger.white,
              borderRadius: BorderRadius.circular(50.r),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0.r),
              child: SVGIcon(
                widget.checked! ? AppIcons.redHeartIcon : AppIcons.heartIcon,
                height: 16.h,
                width: 16.w,
              ),
            ),
          ),
        );
      }
    );
  }
}
