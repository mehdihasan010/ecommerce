import 'dart:async';

import 'package:ecommerce_project/app/app_colors.dart';
import 'package:ecommerce_project/app/app_constants.dart';
import 'package:ecommerce_project/features/auth/ui/screens/complete_profile_screen.dart';
import 'package:ecommerce_project/features/auth/ui/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  static const String name = '/otp-verification';

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final TextEditingController _otpTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxInt _remainingTime = AppConstants.resendOtpTimeOutInSecs.obs;

  @override
  void initState() {
    super.initState();
    _startResendCodeTime();
  }

  void _startResendCodeTime() {
    Timer.periodic(const Duration(seconds: 1), (t) {
      if (t.tick <= 10) {
        _remainingTime.value = _remainingTime.value - 1;
      } else {
        t.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100, left: 20, right: 20),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const AppIconWidget(),
                  const SizedBox(height: 20),
                  Text(
                    'Enter OTP Code',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'A 6 Digit OTP Code has been sent',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(height: 30),
                  PinCodeTextField(
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.black,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: 50,
                      fieldWidth: 40,
                      activeFillColor: Colors.white,
                      inactiveFillColor: Colors.white,
                      inactiveColor: AppColors.themeColor,
                      activeColor: AppColors.themeColor,
                      selectedFillColor: Colors.white,
                      selectedColor: AppColors.themeColor,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    //backgroundColor: Colors.blue.shade50,
                    enableActiveFill: true,
                    controller: _otpTEController,
                    appContext: context,
                    onCompleted: (v) {
                      print("Completed");
                    },
                    onChanged: (value) {
                      print(value);
                      setState(() {
                        //currentText = value;
                      });
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      //if (_formKey.currentState!.validate()) {}
                      Navigator.pushNamed(context, CompleteProfileScreen.name);
                    },
                    child: const Text('Next'),
                  ),
                  const SizedBox(height: 30),
                  Obx(() {
                    return RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        text: 'This Code will be expire in ',
                        children: [
                          TextSpan(
                            style: TextStyle(
                              color: _remainingTime == 0
                                  ? Colors.grey
                                  : AppColors.themeColor,
                            ),
                            text: '${_remainingTime}s',
                          ),
                        ],
                      ),
                    );
                  }),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Resent Code',
                      style: TextStyle(
                        color: AppColors.themeColor,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
