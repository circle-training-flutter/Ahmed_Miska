import 'package:circletraning/core/widgets/loading_widget.dart';
import 'package:circletraning/data/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import 'category_item.dart';

class CategoryGridview extends StatelessWidget {
  const CategoryGridview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: (142.h + 4.h) * ceil(8,4),
      // width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Consumer<CategoryProvider>(
          builder: (context, provider, child) {
            if (provider.isFailure) {
              return CustomErrorWidget(
                  errMessage: provider.catfailure.errMessage);
            }
            return GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                childAspectRatio: .6,
                crossAxisSpacing: 4.w,
                mainAxisSpacing: 4.h,
              ),
              itemBuilder: (context, index) {
                return provider.isloading
                    ? const LoadingWidget()
                    : CategoryItem(
                        index: index,
                        categoryModel: provider.categoryModelList[index],
                      );
              },
            );
          },
        ),
      ),
    );
  }
}
