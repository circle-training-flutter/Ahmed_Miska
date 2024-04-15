import 'package:circletraning/core/theming/colors.dart';
import 'package:circletraning/core/widgets/custom_red_buttom.dart';
import 'package:circletraning/data/providers/login_provider.dart';
import 'package:circletraning/features/sign_in/ui/widgets/phone_input_field.dart';
import 'package:circletraning/features/sign_in/ui/widgets/select_country_continer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/helpers/consatants.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/svg_icon.dart';
import '../../../data/models/body/login_request_model.dart';
import '../../product/ui/widgets/row_of_prouducts.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfReturnedScreens(title: ''),
            Expanded(
              child: SingleChildScrollView(
                // physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: SVGIcon(
                          AppIcons.logoAndNameIcon,
                          height: 120.h,
                          width: 134.w,
                        ),
                      ),
                      verticalSpace(64),
                      Text(
                        'hey',
                        style: TextStyles.font28MadaRegularGray,
                      ).tr(),
                      verticalSpace(8),
                      Text(
                        'sign_in_now',
                        style: TextStyles.font14MadaRegularBlack.copyWith(color: ColorManger.gray),
                      ).tr(),
                      verticalSpace(24),
                      const SelectCountryContainer(),
                      verticalSpace(16),
                      Consumer<LoginProvider>(
                        builder: (context, provider, _) {
                          return Column(
                            children: [
                              CustomInputTextField(
                                readOnly: false,
                                controller: provider.phoneController,
                                formKey: provider.formKey,
                                hitText: 'phone_number',
                                prefixIcon: AppIcons.phoneIcon,
                                validator: (value) {
                                  if (value == null || value.isEmpty || value.length < 10 || value.length > 11) {
                                    return tr('The number is not vailed');
                                  }
                                  return null;
                                },
                              ),
                              verticalSpace(24),
                              CustomRedButtom(
                                onTap: () {
                                  if (provider.formKey.currentState!.validate()) {
                                    if (provider.phoneController.text.length == 11) {
                                      provider.login(LoginRequestBody(provider.phoneController.text.substring(1)), context);
                                    } else {
                                      provider.login(LoginRequestBody(provider.phoneController.text), context);
                                    }
                                  }
                                },
                                width: double.infinity,
                                child: Center(
                                  child: provider.isLoading
                                      ? SizedBox(
                                          height: 20.h,
                                          width: 20.w,
                                          child: const CircularProgressIndicator(),
                                        )
                                      : Text(
                                          'in',
                                          style: TextStyles.font14MadaRegularWith,
                                        ).tr(),
                                ),
                              ),
                              verticalSpace(16),
                            ],
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
