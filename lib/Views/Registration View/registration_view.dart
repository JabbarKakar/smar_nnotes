import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../Utils/app_constants.dart';
import '../../Utils/app_text.dart';
import '../../Widgets/custom_text_form_field.dart';
import '../../Widgets/main_body_container.dart';
import '../../Widgets/main_button.dart';
import '../Explorer View/explorer_view.dart';
import '../Login View/login_view.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({super.key});

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MainBodyContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    60.ht,
                    const Text30(text: 'SMARNOTES'),
                    20.ht,
                    const Text30(text: 'Create new\nAccount', border: Border()),
                    10.ht,
                    Text10(
                      text: 'Already Registered? Log in here.',
                      onTap: () {
                        Get.to(() => const LoginView());
                      },
                    ),
                    50.ht,
                    const Text14(text: 'NAME', alignment: Alignment.bottomLeft),
                    15.ht,
                    CustomTextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      obscureText: false,
                      hintText: 'Name',
                      validator: (value) {
                        return null;
                      },
                    ),
                    45.ht,
                    const Text14(text: 'EMAIL', alignment: Alignment.bottomLeft),
                    15.ht,
                    CustomTextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                      hintText: 'Email',
                      validator: AppConstants.emailValidation,
                    ),
                    45.ht,
                    const Text14(
                        text: 'PASSWORD', alignment: Alignment.bottomLeft),
                    15.ht,
                    CustomTextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      hintText: 'Password',
                      validator: AppConstants.passwordValidation,
                    ),
                    45.ht,
                    MainButton(
                      title: "Sign Up",
                      onTap: () {
                        String? name = nameController.text.trim();
                        String? nameError = AppConstants.firstNameValidator(name);
                        String? email = emailController.text.trim();
                        String? emailError = AppConstants.emailValidation(email);
                        String? password = passwordController.text.trim();
                        String? passwordError = AppConstants.passwordValidation(password);

                        if(nameError != null){
                          AppConstants.errorToast(message: nameError);
                        }
                        else if(emailError != null){
                          AppConstants.errorToast(message: emailError);
                          return;
                        }
                        else if(passwordError != null){
                          AppConstants.errorToast(message: passwordError);
                          return;
                        }else{
                          Get.offAll(() => const ExplorerView());
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
