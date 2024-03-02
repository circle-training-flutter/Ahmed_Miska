import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';

class PicturesSwiper extends StatelessWidget {
  const PicturesSwiper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      width: double.infinity,
      child: Swiper(
        onTap: (index) {},
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: Image.asset(
              Assets.pic1,
              fit: BoxFit.fill,
            ),
          );
        },
        autoplayDelay: 3000,
        autoplay: true,
        curve: Curves.ease,
        duration: 600,
        viewportFraction: .9,
        scale: .95,
        loop: true,
      ),
    );
  }
}
