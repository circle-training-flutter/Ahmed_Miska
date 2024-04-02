import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/helpers/extentions.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/features/pay_and_delevary/ui/widgets/container_of_pay_and_delevary.dart';
import 'package:circletraning/features/pay_and_delevary/ui/widgets/listview_of_items_in_pay_and_delevary_screen.dart';
import 'package:circletraning/features/pay_and_delevary/ui/widgets/notes_text_field.dart';
import 'package:circletraning/features/pay_and_delevary/ui/widgets/pay_way_buttom_sheet.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helpers/functions.dart';
import '../../../core/theming/styles.dart';
import '../../bill/ui/bill_screen.dart';
import '../../product/ui/widgets/row_of_prouducts.dart';
import '../../product_details/ui/widgets/total_price.dart';

class PayAndDelevaryScreen extends StatelessWidget {
  final int price;
  const PayAndDelevaryScreen({Key? key, required this.price}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfReturnedScreens(title: 'pay_and_delevary'),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
                  child: Column(
                    children: [
                      const ListviewOfItemsInPayAndDelevaryScreen(),
                      verticalSpace(12),
                      ContainerOfPayAndDelevary(
                        onTap: () {},
                        title: 'delivery_address',
                        primTitle: 'address',
                        icon: AppIcons.locationIcon,
                      ),
                      verticalSpace(12),
                      ContainerOfPayAndDelevary(
                        onTap: () {
                          displayBottomSheet(
                              context, const PayWayButtomSheet());
                        },
                        title: 'payment_method',
                        primTitle: 'cash',
                        icon: AppIcons.payIcon,
                      ),
                      verticalSpace(12),
                      const NotesTextField()
                    ],
                  ),
                ),
              ),
            ),
            TotalPrice(
              price: price,
              buttom: Text(
                'confirm',
                style: TextStyles.font14MadaRegularWith,
              ).tr(),
              onTap: () {
                push(const BillScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}
