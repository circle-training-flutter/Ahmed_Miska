import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/helpers/consatants.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/svg_icon.dart';
import '../../../../data/providers/city_provider.dart';

CityProvider cityProvider = getIt();

class ChooseCityDropDown extends StatefulWidget {
  final void Function(int productId) onProductSelected;
  final Key formKey;
  const ChooseCityDropDown({
    super.key,
    required this.onProductSelected,
    required this.formKey,
  });

  @override
  State<ChooseCityDropDown> createState() => _ChooseCityDropDownState();
}

class _ChooseCityDropDownState extends State<ChooseCityDropDown> {
  List<String> items = [];
  @override
  void initState() {
    cityProvider.getCity();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    for (var element in Provider.of<CityProvider>(context).cityList) {
      items.add(element.title!);
    }
    super.didChangeDependencies();
  }

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: ColorManger.grayLight),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
          child: DropdownButtonFormField2(
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
            validator: (value) {
              if (value == null) {
                return 'choose_city'.tr();
              }
              return null;
            },
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
                selectedValue = value;
              });
              widget.onProductSelected(cityProvider.cityList[items.indexOf(value!)].id!);
            },
          ),
        ),
      ),
    );
  }
}
