import 'package:circletraning/data/providers/category_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'category_of_category_screen.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../core/widgets/loading_widget.dart';
import '../../../../core/theming/colors.dart';

class ListViewOfCategoryInCategoryScreen extends StatefulWidget {
  final void Function(int productId) onProductSelected;

  const ListViewOfCategoryInCategoryScreen({
    Key? key,
    required this.onProductSelected,
  }) : super(key: key);

  @override
  State<ListViewOfCategoryInCategoryScreen> createState() =>
      _ListViewOfCategoryInCategoryScreenState();
}

class _ListViewOfCategoryInCategoryScreenState
    extends State<ListViewOfCategoryInCategoryScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 102.w,
      decoration: BoxDecoration(
        color: ColorManger.grayMoreLight,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Consumer<CategoryProvider>(
        builder: (context, provider, child) {
          if (provider.isloading) {
            return const LoadingWidget();
          }
          if (provider.isFailure) {
            return CustomErrorWidget(
              errMessage: provider.catfailure.errMessage,
            );
          }
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final categoryModel = provider.categoryModelList[index];
              return GestureDetector(
                onTap: () {
                  setState(
                    () {
                      _selectedIndex = index;
                    },
                  );
                  widget.onProductSelected(categoryModel.id!);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.w),
                  child: CategoryOfCatScreen(
                    categoryModel: categoryModel,
                    isSelected: _selectedIndex == index,
                  ),
                ),
              );
            },
            itemCount: provider.categoryModelList.length,
          );
        },
      ),
    );
  }
}
