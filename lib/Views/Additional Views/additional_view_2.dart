import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smar_notes/Utils/app_constants.dart';
import 'package:smar_notes/Views/Profile%20VIew/profile_view.dart';
import 'package:smar_notes/Widgets/custom_app_bar.dart';
import 'package:smar_notes/Widgets/main_body_container.dart';
import 'package:smar_notes/Widgets/main_drawer.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_text.dart';
import '../../Widgets/custom_fab.dart';
import '../../Widgets/custom_white_button.dart';
import '../../Widgets/small_custom_button.dart';
import '../Recording View/recording_view.dart';
import 'additional_view_3.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class AdditionalView2 extends StatefulWidget {
  final String title;
  const AdditionalView2(
      {super.key, required this.title, });

  @override
  State<AdditionalView2> createState() => _AdditionalView2State();
}

class _AdditionalView2State extends State<AdditionalView2> {
  List<Widget> customWhiteButtons = [];
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
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 250.w,
                  decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: whiteColor))),
                  child: Text20(
                    text: widget.title,
                  ),
                ),
                15.ht,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SmallCustomButton(
                      title: 'Back',
                      onTap: () {
                        Get.back();
                      },
                    ),
                    SmallCustomButton(
                      title: 'Search',
                      onTap: (){},
                    ),
                  ],
                ),
                25.ht,
                CustomWhiteButton(
                  text: 'Test GmbH',
                  onTap: () {
                    Get.to(() => const AdditionalView3(title: 'Test GmbH',));
                  },
                ),
                15.ht,
                CustomWhiteButton(
                  text: 'United Testing AG',
                  onTap: () {
                    Get.to(() => const AdditionalView3(title: 'United Testing AG',));
                  },
                ),
                15.ht,
                CustomWhiteButton(
                  text: 'Test Inc.',
                  onTap: () {
                    Get.to(() => const AdditionalView3(title: 'Test Inc.',));
                  },
                ),
                ListView.builder(
                  itemCount: customWhiteButtons.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return  Padding(
                      padding: EdgeInsets.only(top: 10.h),
                      child: InkWell(
                        onTap: (){
                          Get.to(() => const AdditionalView3(title: 'Test Inc.',));
                        },
                          child: customWhiteButtons[index]),
                    );
                  },),
                20.ht,
                SizedBox(
                  width: 110.w,
                  child: SmallCustomButton(
                    child: const Icon(
                        Icons.add_circle_outline_sharp),
                    onTap: () {
                      showAlertDialog(context);
                    },
                  ),
                )
              ],
            ),
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


  Future<void> showAlertDialog(BuildContext context) async {
    TextEditingController titleController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: whiteColor,
          child: Container(
            width: 200.w,
            height: 200.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: whiteColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: blackColor),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: TextFormField(
                        controller: titleController,
                        style: const TextStyle(color: blackColor),
                        decoration: const InputDecoration(
                          filled: true,
                          hintText: "Please Enter file name",
                          fillColor: whiteColor,
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SmallCustomButton(
                        onTap: () {
                          Get.back();
                        },
                        title: 'Cancel',
                      ),
                      SmallCustomButton(
                        onTap: () {
                          setState(() {
                            customWhiteButtons.add(
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: 3.h),
                                child: CustomWhiteButton(
                                  text: titleController.text.trim(),
                                  onTap: () {  },
                                ),
                              ),
                            );
                          });
                          Get.back();
                        },
                        title: 'Create',
                      ),
                    ],
                  ),
                  // Display the CustomWhiteButton widgets in the dialog

                ],
              ),
            ),
          ),
        );
      },
    );
  }

}