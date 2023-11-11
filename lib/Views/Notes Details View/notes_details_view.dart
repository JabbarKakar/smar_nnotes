import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smar_notes/Utils/app_colors.dart';
import 'package:smar_notes/Utils/app_constants.dart';
import 'package:smar_notes/Utils/app_text.dart';
import 'package:smar_notes/Views/Profile%20VIew/profile_view.dart';
import 'package:smar_notes/Widgets/custom_app_bar.dart';
import 'package:smar_notes/Widgets/main_body_container.dart';
import 'package:smar_notes/Widgets/main_drawer.dart';
import 'package:smar_notes/Widgets/small_custom_button.dart';

import '../../Widgets/bullet_text.dart';
import '../Workbech View/workbench_view.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class NotesDetailsView extends StatefulWidget {
  final String title;
  const NotesDetailsView({super.key, required this.title});

  @override
  State<NotesDetailsView> createState() => _NotesDetailsViewState();
}

class _NotesDetailsViewState extends State<NotesDetailsView> {


  List<String> details =[
    'Date: October 29 2023',
    'Time: 10:00 AM - 11:30 AM',
    'Location: Frankfurt a.M.',
    'Attendees:',
    'Sarah Johnson (CEO)',
    'Mark Lee (CTO)',
    'Emily Chen (Head of Marketing',
    'Alex Rodriguez (Lead Developer',
    'Rachel Patel (Product Manager',
    '1. Opening',
    'Welcome and Introduction',
    'Purpose of Meeting: Discuss Q4\nGoals and progress',
    '1. Review of Previous Action Items',
    'Sarah: Finalize the Q4 marketing\nbudget - Completed',
    'Mark: Prototype new features',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        text: widget.title,
        onTapMenu: () {
          scaffoldKey.currentState!.openDrawer();
        },
        onTapProfile: () {
          Get.to(() => const ProfileView());
        },),
      drawer: const MainDrawer(),
      body: MainBodyContainer(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              18.ht,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SmallCustomButton(onTap: (){
                    Get.back();
                  },title: 'Back',),
                  SmallCustomButton(onTap: (){},title: 'Search',),
                  SmallCustomButton(onTap: (){},title: 'Share',),
                ],
              ),
              20.ht,
              Container(
                height: 660.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: whiteColor,
                    width: 3
                  ),
                  borderRadius: BorderRadius.circular(15.r)
                ),
                child: Scrollbar(
                  thickness: 5,
                  thumbVisibility: true,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Container(
                            width: double.infinity,
                            decoration: const BoxDecoration(
                              border: Border(bottom:  BorderSide(color: whiteColor, width: 3))
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text20(text: widget.title),
                                SmallCustomButton(
                                  onTap: (){
                                    Get.to(() => WorkbenchView(title: widget.title, details: details));
                                  },
                                  title: "Edit",
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text20(text: 'Date: October 29 2023',color: whiteColor,),
                              const Text20(text: 'Time: 10:00 AM - 11:30 AM',color: whiteColor,),
                              const Text20(text: 'Location: Frankfurt a.M.',color: whiteColor,),
                              10.ht,
                              const Text20(text: 'Attendees:', color: whiteColor,),
                              const BulletText(text: 'Sarah Johnson (CEO)',),
                              const BulletText(text: 'Mark Lee (CTO)',),
                              const BulletText(text: 'Emily Chen (Head of Marketing',),
                              const BulletText(text: 'Alex Rodriguez (Lead Developer',),
                              const BulletText(text: 'Rachel Patel (Product Manager',),
                              10.ht,
                              const Text20(text: '1. Opening', color: whiteColor,),
                              const BulletText(text: 'Welcome and Introduction',),
                              const BulletText(text: 'Purpose of Meeting: Discuss Q4\nGoals and progress',),
                              10.ht,
                              const Text20(text: '1. Review of Previous Action Items', color: whiteColor,),
                              const BulletText(text: 'Sarah: Finalize the Q4 marketing\nbudget - Completed',),
                              const BulletText(text: 'Mark: Prototype new features',),

                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
    );
  }
}

