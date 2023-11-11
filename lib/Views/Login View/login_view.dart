import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smar_notes/Utils/app_constants.dart';
import 'package:smar_notes/Views/Explorer%20View/explorer_view.dart';
import 'package:smar_notes/Views/Registration%20View/registration_view.dart';
import '../../Utils/app_images.dart';
import '../../Utils/app_text.dart';
import '../../Widgets/custom_text_form_field.dart';
import '../../Widgets/main_body_container.dart';
import '../../Widgets/main_button.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MainBodyContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  60.ht,
                  const Text30(text: 'SMARNOTES'),
                  20.ht,
                  const Text30(text: 'Login', border: Border()),
                  10.ht,
                  Text10(
                    text: 'Sign in to continue.',
                    onTap: () {},
                  ),
                  50.ht,
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
                    title: "Login",
                    onTap: () {
                      String? email = emailController.text.trim();
                      String? emailError = AppConstants.emailValidation(email);
                      String? password = passwordController.text.trim();
                      String? passwordError = AppConstants.passwordValidation(password);

                      if(emailError != null){
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
                  ),
                  35.ht,
                  const Text14(
                      text: 'or', alignment: Alignment.center),
                  35.ht,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 56.h,
                          width: 56.h,
                          child: Image.asset(AppImages.email)),
                      SizedBox(
                          height: 56.h,
                          width: 56.h,
                          child: Image.asset(AppImages.window)),
                      SizedBox(
                          height: 56.h,
                          width: 56.h,
                          child: Image.asset(AppImages.gitHub)),

                    ],
                  ),
                  50.ht,
                  MainButton(
                      title: "Sign Up",
                    onTap: (){
                        Get.off(() => const RegistrationView());
                    }, )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
