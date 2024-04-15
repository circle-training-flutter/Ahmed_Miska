import 'package:circletraning/features/sign_in/ui/widgets/phone_input_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_check_box.dart';

class InvitedByUser extends StatefulWidget {
  final TextEditingController controller;
  const InvitedByUser({
    super.key,
    required this.controller,
  });

  @override
  State<InvitedByUser> createState() => _InvitedByUserState();
}

class _InvitedByUserState extends State<InvitedByUser> {
  Key formKey = GlobalKey<FormState>();

  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CustomCheckBox(
              onProductSelected: (bool check) {
                setState(() {
                  isChecked = check;
                });
              },
            ),
            horizontalSpace(8),
            Text(
              'invited_by_user',
              style: TextStyles.font14MadaRegularBlack,
            ).tr(),
          ],
        ),
        verticalSpace(16),
        isChecked
            ? CustomInputTextField(
                readOnly: false,
                controller: widget.controller,
                formKey: formKey,
                hitText: 'enter_the_code',
              )
            : const SizedBox(),
      ],
    );
  }
}
