import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/svg_icon.dart';

class ChooseCityDropDown extends StatefulWidget {
  const ChooseCityDropDown({
    super.key,
  });

  @override
  State<ChooseCityDropDown> createState() => _ChooseCityDropDownState();
}

class _ChooseCityDropDownState extends State<ChooseCityDropDown> {
  List<String> items = [
    'cairo',
    'menoufia',
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: ColorManger.grayLight),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: [
                SVGIcon(
                  AppIcons.cityIcon,
                ),
                horizontalSpace(8),
                Text(
                  'cityy',
                  style: TextStyles.font14MadaRegularBlack,
                ).tr()
              ],
            ),
            value: selectedValue,
            items: items
                .map(
                  (String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyles.font14MadaRegularBlack,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                )
                .toList(),
            onChanged: (value) {
              setState(() {
                selectedValue = value.toString();
              });
            },
          ),
        ),
      ),
    );
  }
}
