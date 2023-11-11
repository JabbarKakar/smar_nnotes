import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:smar_notes/Utils/app_constants.dart';
import 'package:smar_notes/Views/Explorer%20View/explorer_view.dart';
import 'package:smar_notes/Views/Login%20View/login_view.dart';
import 'package:smar_notes/Views/Profile%20VIew/profile_view.dart';
import 'package:smar_notes/Views/new_screen.dart';

import '../Utils/app_colors.dart';
import '../Utils/app_images.dart';
import '../Utils/app_text.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> drawerItems = [
      "Explorer",
      "Profile",
      "My Recordings",
      "Logout",
      // "Help",
    ];
    List<IconData> drawerIcons = [
      Icons.home_filled,
      Icons.person,
      Icons.emergency_recording_sharp,
      Icons.logout,
    ];

    List<Widget> screens = [
      const ExplorerView(),
      const ProfileView(),
      const NewScreen(),
      const LoginView()
    ];
    return Drawer(
      backgroundColor: primaryColor1,
      child: ListView(
        children: [
          Container(
            height: 200.h,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: primaryColor3,
            ),
            child: Column(
              children: [
                30.ht,
                SvgPicture.asset(AppImages.profile, color: whiteColor,),
                10.ht,
                const Text20(text: 'Your Name'),
                const Text14(text: 'example@gmail.com', alignment: Alignment.center)
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 780.h,
                  child: ListView.builder(
                    itemCount: drawerItems.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 5.sp),
                        child: InkWell(
                          onTap: (){
                            Get.back();
                            Get.to(screens[index]);
                          },
                          child: Container(
                            height: 60.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: primaryColor3,
                                borderRadius: BorderRadius.circular(10.sp)
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 15.w),
                              child: Row(
                                children: [
                                  Icon(drawerIcons[index], color: whiteColor,),
                                  15.wd,
                                  Text20(text: drawerItems[index]),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}