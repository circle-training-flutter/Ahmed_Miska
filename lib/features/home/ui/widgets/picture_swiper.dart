import 'package:card_swiper/card_swiper.dart';
import 'package:circletraning/core/widgets/custom_error_widget.dart';
import 'package:circletraning/core/widgets/loading_widget.dart';
import 'package:circletraning/data/providers/slider_image_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/cached_network_image.dart';

class PicturesSwiper extends StatelessWidget {
  const PicturesSwiper({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160.h,
      // width: double.infinity,
      child: Consumer<SliderImageProvider>(builder: (context, provider, child) {
        if (provider.isSliderFailure) {
          return CustomErrorWidget(
              errMessage: provider.sliderfailure.errMessage);
        }
        return Swiper(
          allowImplicitScrolling: true,
          onTap: (index) {},
          itemCount:
              provider.isloadingSlider ? 1 : provider.sliderModelDatad.data!.slider!.length,
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: provider.isloadingSlider
                  ? const LoadingWidget()
                  : CachedImage(
                      image: provider.sSliderList![index].image!,
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
        );
      }),
    );
  }
}
