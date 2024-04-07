import 'package:circletraning/features/home/ui/widgets/category_gridview.dart';
import 'package:circletraning/features/home/ui/widgets/picture_swiper.dart';
import 'package:circletraning/features/home/ui/widgets/product_gridview.dart';
import 'package:circletraning/features/home/ui/widgets/row_of_home_page.dart';
import 'package:circletraning/features/home/ui/widgets/search_and_chose_city.dart';
import 'package:flutter/material.dart';
import '../../../core/helpers/spacing.dart';
import 'widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppBar(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                const SearchAndChoseCity(),
                verticalSpace(16),
                const PicturesSwiper(),
                verticalSpace(32),
                const RowOfHomePage(text: 'category'),
                verticalSpace(12),
                const CategoryGridview(),
                verticalSpace(32),
                const RowOfHomePage(text: 'latest_products'),
                verticalSpace(28),
                const ProductGridview()
              ],
            ),
          ),
        )
      ],
    );
  }
}
