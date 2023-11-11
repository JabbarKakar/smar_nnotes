import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:smar_notes/Utils/app_colors.dart';
import 'package:smar_notes/Utils/app_constants.dart';
import 'package:smar_notes/Utils/app_images.dart';
import 'package:smar_notes/Utils/app_text.dart';
import 'package:smar_notes/Views/Login%20View/login_view.dart';
import 'package:smar_notes/Widgets/custom_app_bar.dart';
import 'package:smar_notes/Widgets/main_body_container.dart';
import 'package:smar_notes/Widgets/main_button.dart';
import 'package:smar_notes/Widgets/main_drawer.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
          text: 'Profile',
          onTapMenu: (){
            scaffoldKey.currentState!.openDrawer();
          },
          onTapProfile: (){},
      ),
      drawer: const MainDrawer(),
      body: MainBodyContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(AppImages.profile, height: 97.h, width: 97.h,),
                    Column(
                      children: [
                        const Text20(text: 'Username:', color: whiteColor,),
                        const Text20(text: 'maz.kleinert', color: whiteColor,),
                        15.ht,
                        const Text20(text: 'Member Since: 2023', color: whiteColor,),
                      ],
                    )
                  ],
                ),
              ),
              30.ht,
              const ProfileListTile(title: 'Account'),
              const ProfileListTile(title: 'Security'),
              const ProfileListTile(title: 'Join company archive'),
              const ProfileListTile(title: 'Subscription Status '),
              const ProfileListTile(title: 'Payment Method'),
              const ProfileListTile(title: 'Help?'),
              const ProfileListTile(title: 'Feedback | New Feature wanted?'),
              25.ht,
              MainButton(onTap: (){
                Get.offAll(() => const LoginView());
              }, title: 'Log out')


            ],
          ),
        ),
      ),
    );
  }
}


class ProfileListTile extends StatelessWidget {
  final String title;
  const ProfileListTile({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 50.h,
        width: double.infinity,
        decoration: const BoxDecoration(
            border: Border(bottom: BorderSide(color: whiteColor, width: .5))
        ),
        child: Text20(text: title,color: whiteColor,textAlign: TextAlign.left),
      ),
    );
  }
}
