import 'package:ecommerce_project/features/auth/ui/screens/otp_verification_screen.dart';
import 'package:ecommerce_project/features/auth/ui/widgets/app_icon_widget.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  static const String name = '/email-verification';

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  final TextEditingController _emailTEController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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
                    'Welcome Back',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Please Enter Your Email Adderss',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(height: 30),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _emailTEController,
                    decoration: const InputDecoration(
                      hintText: 'Email Address',
                    ),
                    keyboardType: TextInputType.emailAddress,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your email adderss';
                      }
                      if (!EmailValidator.validate(value!)) {
                        return 'Enter a valid email address';
                      }
                    },
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      //if (_formKey.currentState!.validate()) {}
                      Navigator.pushNamed(context, OtpVerificationScreen.name);
                    },
                    child: const Text('Next'),
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
