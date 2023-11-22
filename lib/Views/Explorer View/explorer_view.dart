import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:smar_notes/Utils/app_constants.dart';
import 'package:smar_notes/Views/Profile%20VIew/profile_view.dart';
import 'package:smar_notes/Views/Recording%20View/recording_view.dart';
import 'package:smar_notes/Widgets/main_body_container.dart';
import 'package:smar_notes/Widgets/main_drawer.dart';

import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_fab.dart';
import '../../Widgets/custom_white_button.dart';
import '../Additional Views/additional_view_1.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class ExplorerView extends StatefulWidget {
  const ExplorerView({super.key});

  @override
  State<ExplorerView> createState() => _ExplorerViewState();
}

class _ExplorerViewState extends State<ExplorerView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: CustomAppBar(
          text: 'Explorer',
          onTapMenu: () {
            scaffoldKey.currentState!.openDrawer();
          },
          onTapProfile: () {
            Get.to(() => const ProfileView());
          },
        ),
        drawer: const MainDrawer(),
        body: MainBodyContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CustomWhiteButton(
                      text: "My Notes",
                      onTap: () {
                        Get.to(() => const AdditionalView1(
                              title: 'My Notes',
                            ));
                      },
                    ),
                    30.ht,
                    CustomWhiteButton(
                      text: "My Recordings",
                      onTap: () {
                        Get.to(() => const AdditionalView1(
                              title: 'My Recordings',
                            ));
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: CustomFAB(
          onTap: () {
            Get.to(() => const RecordingView());
          },
        ),
    );
  }
}
