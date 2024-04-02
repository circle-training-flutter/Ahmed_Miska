import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
// import 'package:pinput/pinput.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class OtpAndSendTheCode extends StatefulWidget {
  const OtpAndSendTheCode({Key? key}) : super(key: key);

  @override
  State<OtpAndSendTheCode> createState() => _OtpAndSendTheCodeState();
}

class _OtpAndSendTheCodeState extends State<OtpAndSendTheCode> {
  int secondsRemaining = 59;
  bool enableResend = false;
  Timer? timer;
  _initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining != 0) {
        setState(() {
          secondsRemaining--;
        });
      } else {
        setState(() {
          enableResend = true;
        });
      }
    });
  }

  void _resendCode() {
    //other code here
    setState(() {
      secondsRemaining = 59;
      enableResend = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Pinput(
        //   onCompleted: (v) {
        //     setState(() {
        //       _initState();
        //     });
        //   },
        //   closeKeyboardWhenCompleted: true,
        //   length: 5,
        //   defaultPinTheme: PinTheme(
        //     width: 49.w,
        //     height: 57.h,
        //     decoration: const BoxDecoration(
        //       border: Border(
        //         bottom: BorderSide(color: ColorManger.grayLight),
        //       ),
        //     ),
        //     textStyle: TextStyles.font24MadaSemiBoldRed,
        //   ),
        // ),

        PinCodeTextField(
          appContext: context,
          keyboardType: TextInputType.number,
          length: 5,
          obscureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
            shape: PinCodeFieldShape.underline,
          ),
          onCompleted: (value) {
            setState(() {
              _initState();
            });
          },
        ),
        verticalSpace(16),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(
                    () {
                      if (enableResend) {
                        _resendCode();
                      }
                    },
                  );
                },
                child: Text(
                  'resend_the_code',
                  style: TextStyles.font14MadaRegularWith
                      .copyWith(color: ColorManger.red),
                ).tr(),
              ),
              const Spacer(),
              Text(
                secondsRemaining.toString(),
                style: TextStyles.font14MadaRegularBlack,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
