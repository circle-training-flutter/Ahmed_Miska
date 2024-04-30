import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/core/utils/screen_state_layout.dart';
import 'package:circletraning/core/widgets/custom_red_buttom.dart';
import 'package:circletraning/data/providers/my_points_provider.dart';
import 'package:circletraning/features/points/ui/widgets/invite_friend_listview.dart';
import 'package:circletraning/features/points/ui/widgets/my_points_container.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../product/ui/widgets/row_of_prouducts.dart';

class PointsScreen extends StatefulWidget {
  const PointsScreen({Key? key}) : super(key: key);

  @override
  State<PointsScreen> createState() => _PointsScreenState();
}

class _PointsScreenState extends State<PointsScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<MyPointsProvider>(context, listen: false).getMyPoints();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfReturnedScreens(title: 'points'),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Consumer<MyPointsProvider>(builder: (context, provider, _) {
                    return ScreenStateLayout(
                      isLoading: provider.isLoading,
                      isError: provider.isFailure,
                      isEmpty: provider.myPointsModel == null,
                      error: provider.productfailure.errMessage,
                      builder: (BuildContext context) {
                        return Column(
                          children: [
                            MyPointsContianer(
                              points: provider.myPointsModel!.data!.points!,
                            ),
                            CustomRedButtom(
                              onTap: () {},
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: Text(
                                  'invite_friend',
                                  style: TextStyles.font14MadaRegularWith,
                                ).tr(),
                              ),
                            ),
                            verticalSpace(12),
                            InvitefriendListview(history: provider.myPointsList),
                            verticalSpace(10)
                          ],
                        );
                      },
                    );
                  }),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
