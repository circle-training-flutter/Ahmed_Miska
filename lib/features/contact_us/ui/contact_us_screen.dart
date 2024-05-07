import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/helpers/spacing.dart';
import 'package:circletraning/core/helpers/validaitor.dart';
import 'package:circletraning/core/theming/colors.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/core/widgets/custom_red_buttom.dart';
import 'package:circletraning/core/widgets/svg_icon.dart';
import 'package:circletraning/data/models/body/contact_us_request_model.dart';
import 'package:circletraning/data/providers/contact_us_provider.dart';
import 'package:circletraning/features/contact_us/ui/widgets/connect_us_textfield.dart';
import 'package:circletraning/features/product/ui/widgets/row_of_prouducts.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({Key? key}) : super(key: key);

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const AppBarOfReturnedScreens(title: 'connect_us'),
            verticalSpace(24),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Consumer<ContactUsProvider>(builder: (context, provider, _) {
                    return Column(
                      children: [
                        SVGIcon(
                          AppIcons.connectUsIcon,
                          height: 150.h,
                          width: 196.w,
                        ),
                        verticalSpace(48),
                        ConnectUsTextField(
                          title: 'the_name',
                          icon: AppIcons.nameIcon,
                          controller: provider.nameController,
                          formKey: provider.nameFormKey,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'the_name'.tr();
                            }
                            return null;
                          },
                        ),
                        const Divider(color: ColorManger.grayLight),
                        ConnectUsTextField(
                          title: 'email',
                          icon: AppIcons.emailIcon,
                          controller: provider.emailController,
                          formKey: provider.emailFormKey,
                          validator: (value) {
                            if (!isEmail(value!)) {
                              return 'Enter a valid email address';
                            }
                            return null;
                          },
                        ),
                        const Divider(color: ColorManger.grayLight),
                        ConnectUsTextField(
                          title: 'message_title',
                          icon: AppIcons.noteTitleIcon,
                          controller: provider.subjectController,
                          formKey: provider.subjectFormKey,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'message_title'.tr();
                            }
                            return null;
                          },
                        ),
                        const Divider(color: ColorManger.grayLight),
                        ConnectUsTextField(
                          maxLines: 10,
                          title: 'message',
                          icon: AppIcons.notesIcon,
                          controller: provider.messageController,
                          formKey: provider.messageFormKey,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'message'.tr();
                            }
                            return null;
                          },
                        ),
                        const Divider(color: ColorManger.grayLight),
                        verticalSpace(48),
                        CustomRedButtom(
                          onTap: () {
                            if (provider.nameFormKey.currentState!.validate() &&
                                provider.emailFormKey.currentState!.validate() &&
                                provider.subjectFormKey.currentState!.validate() &&
                                provider.messageFormKey.currentState!.validate()) {
                              provider.getContactUs(
                                ContactUsRequestModel(
                                  provider.nameController.text,
                                  provider.emailController.text,
                                  provider.subjectController.text,
                                  provider.messageController.text,
                                  provider.phone!,
                                ),
                              );
                            }
                          },
                          width: double.infinity,
                          child: Center(
                            child: provider.isLoading
                                ? const CircularProgressIndicator()
                                : Text(
                                    'send',
                                    style: TextStyles.font14MadaRegularWith,
                                  ).tr(),
                          ),
                        ),
                      ],
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
