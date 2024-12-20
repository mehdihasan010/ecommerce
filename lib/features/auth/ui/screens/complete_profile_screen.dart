import 'package:ecommerce_project/features/auth/ui/widgets/app_icon_widget.dart';
import 'package:flutter/material.dart';

import '../../../common/ui/screens/main_bottom_nav_screen.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  static const String name = '/complete_profile';

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final TextEditingController _firstNameTEController = TextEditingController();
  final TextEditingController _lastNameTEController = TextEditingController();
  final TextEditingController _mobileTEController = TextEditingController();
  final TextEditingController _cityTEController = TextEditingController();
  final TextEditingController _shippingAddressTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 14,
                children: [
                  const AppIconWidget(),
                  Column(
                    children: [
                      Text(
                        'Complete Profile',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      Text(
                        'Get started with us with your details',
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  color: Colors.grey,
                                ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _firstNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'First Name',
                    ),
                    keyboardType: TextInputType.name,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your First Name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _lastNameTEController,
                    decoration: const InputDecoration(
                      hintText: 'Last Name',
                    ),
                    keyboardType: TextInputType.name,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your Last Name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _mobileTEController,
                    decoration: const InputDecoration(
                      hintText: 'Mobile',
                    ),
                    keyboardType: TextInputType.number,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your Mobile Number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _cityTEController,
                    decoration: const InputDecoration(
                      hintText: 'City',
                    ),
                    keyboardType: TextInputType.name,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your city';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: _shippingAddressTEController,
                    decoration: const InputDecoration(
                      hintText: 'Shipping Address',
                    ),
                    keyboardType: TextInputType.name,
                    maxLines: 3,
                    validator: (String? value) {
                      if (value?.trim().isEmpty ?? true) {
                        return 'Enter your Shipping address';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      //if (_formKey.currentState!.validate()) {}
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        MainBottomNavScreen.name,
                        (route) => false,
                      );
                    },
                    child: const Text('Complete'),
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
