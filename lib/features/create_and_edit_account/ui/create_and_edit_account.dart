import 'dart:io';
import 'package:circletraning/core/helpers/consatants.dart';
import 'package:circletraning/core/theming/styles.dart';
import 'package:circletraning/core/widgets/custom_red_buttom.dart';
import 'package:circletraning/data/providers/register_provider.dart';
import 'package:circletraning/features/create_and_edit_account/ui/widgets/choose_city_drop_down.dart';
import 'package:circletraning/features/create_and_edit_account/ui/widgets/invited_by_user.dart';
import 'package:circletraning/features/create_and_edit_account/ui/widgets/name_text_field.dart';
import 'package:circletraning/features/create_and_edit_account/ui/widgets/select_photo.dart';
import 'package:circletraning/features/sign_in/ui/widgets/phone_input_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../../core/helpers/spacing.dart';
import '../../../data/models/body/register_request_model.dart';
import '../../product/ui/widgets/row_of_prouducts.dart';

class CreateAndEditAccount extends StatefulWidget {
  final bool iscreate;
  const CreateAndEditAccount({Key? key, required this.iscreate}) : super(key: key);

  @override
  State<CreateAndEditAccount> createState() => _CreateAndEditAccountState();
}

class _CreateAndEditAccountState extends State<CreateAndEditAccount> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<RegisterProvider>(builder: (context, provider, child) {
          return Column(
            children: [
              AppBarOfReturnedScreens(title: widget.iscreate ? 'create_account' : 'edit_account'),
              verticalSpace(24),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        SelectPhoto(
                          onImageSelected: (XFile image) {
                            setState(() {
                              _image = File(image.path);
                            });
                          },
                        ),
                        verticalSpace(32),
                        Row(
                          children: [
                            NameTextField(
                              formKey: provider.firstNameFormKey,
                              controller: provider.firstNameController,
                              name: 'first_name',
                              validator: (p0) {
                                if (p0 == null || p0.isEmpty) {
                                  return 'invalid_first_name'.tr();
                                }
                                return null;
                              },
                            ),
                            horizontalSpace(8),
                            NameTextField(
                                formKey: provider.lastNameFormKey,
                                controller: provider.lastNameController,
                                name: 'last_name',
                                validator: (p0) {
                                  if (p0 == null || p0.isEmpty) {
                                    return 'invalid_last_name'.tr();
                                  }
                                  return null;
                                })
                          ],
                        ),
                        verticalSpace(32),
                        CustomInputTextField(
                          controller: provider.phoneController,
                          formKey: provider.phoneFormKey,
                          hitText: 'phone_number',
                          prefixIcon: AppIcons.phoneIcon,
                          validator: (p0) {
                            if (p0 == null || p0.isEmpty || p0.length < 10 || p0.length > 11) {
                              return 'invalid_phone_number'.tr();
                            }
                            return null;
                          },
                        ),
                        widget.iscreate
                            ? Column(
                                children: [
                                  verticalSpace(32),
                                  ChooseCityDropDown(
                                    onProductSelected: (int productId) {
                                      provider.cityId = productId;
                                    },
                                    formKey: provider.cityFromKey,
                                  ),
                                  verticalSpace(32),
                                  InvitedByUser(
                                    controller: provider.inviteCodeController,
                                  ),
                                ],
                              )
                            : const SizedBox(),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.h),
                child: CustomRedButtom(
                  onTap: () async {
                    if (provider.firstNameFormKey.currentState!.validate() &&
                        provider.lastNameFormKey.currentState!.validate() &&
                        provider.phoneFormKey.currentState!.validate() &&
                        provider.cityFromKey.currentState!.validate()) {
                      provider.regiter(
                        RegisterRequestBody(
                          invitationCode: provider.inviteCodeController.text,
                          firstName: provider.firstNameController.text,
                          lastName: provider.lastNameController.text,
                          phone: provider.phoneController.text.length == 11 ? provider.phoneController.text.substring(1) : provider.phoneController.text,
                          cityId: provider.cityId!,
                          image: _image,
                        ),
                      );
                      
                    }
                  },
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'confirm',
                      style: TextStyles.font14MadaRegularWith,
                    ).tr(),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
