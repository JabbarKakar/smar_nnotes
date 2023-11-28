import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smar_notes/Utils/app_constants.dart';
import 'package:smar_notes/Views/Profile%20VIew/profile_view.dart';
import 'package:smar_notes/Widgets/custom_app_bar.dart';
import 'package:smar_notes/Widgets/main_body_container.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_text.dart';
import '../../Widgets/custom_fab.dart';
import '../../Widgets/custom_white_button.dart';
import '../../Widgets/main_drawer.dart';
import '../../Widgets/search_text_field.dart';
import '../../Widgets/small_custom_button.dart';
import '../Recording View/recording_view.dart';
import 'additional_view_2.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class AdditionalView1 extends StatefulWidget {
  final String title;
  const AdditionalView1({
    super.key,
    required this.title,
  });

  @override
  State<AdditionalView1> createState() => _AdditionalView1State();
}

class _AdditionalView1State extends State<AdditionalView1> {
  List<String> customWhiteButtons = [];
  List<String> filteredButtons = [];

  void filterButtons() {
    setState(() {
      filteredButtons = customWhiteButtons
          .where((button) => button.toLowerCase().contains(newTitle))
          .toList();
    });
  }

  bool isSearch = false;
  TextEditingController searchController = TextEditingController();

  String newTitle = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        text: 'Explorer',
        onTapMenu: () => scaffoldKey.currentState!.openDrawer(),
        onTapProfile: () => Get.to(() => const ProfileView()),
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
                    SearchTextField(
                      isSearch: isSearch,
                      searchController: searchController,
                      onChanged: (value) {
                        setState(() {
                          newTitle = value.toLowerCase();
                          filterButtons();
                        });
                      },
                    ),
                    SmallCustomButton(
                      title: 'Search',
                      onTap: () {
                        setState(() {
                          isSearch = !isSearch;
                        });
                      },
                    ),
                  ],
                ),
                25.ht,
                customWhiteButtons.isNotEmpty
                    ? filteredButtons.isNotEmpty
                        ? SizedBox(
                            child: ListView.builder(
                                itemCount: filteredButtons.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(top: 10.h),
                                    child: CustomWhiteButton(
                                      text: filteredButtons[index],
                                      onTap: () {
                                        Get.to(() => AdditionalView2(
                                              title: filteredButtons[index],
                                            ));
                                      },
                                      onLongPress: () {
                                        showDeleteConfirmationDialog(index);
                                      },
                                    ),
                                  );
                                }),
                          )
                        : SizedBox(
                            child: ListView.builder(
                                itemCount: customWhiteButtons.length,
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: EdgeInsets.only(top: 10.h),
                                    child: CustomWhiteButton(
                                      text: customWhiteButtons[index],
                                      onTap: () {
                                        Get.to(() => AdditionalView2(
                                              title: customWhiteButtons[index],
                                            ));
                                      },
                                      onLongPress: () {
                                        showDeleteConfirmationDialog(index);
                                      },
                                    ),
                                  );
                                }),
                          )
                    : const Text20(text: 'Please create folder first'),
                20.ht,
                SizedBox(
                  width: 110.w,
                  child: SmallCustomButton(
                    child: const Icon(Icons.add_circle_outline_sharp),
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
    await showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: whiteColor,
        child: Container(
          width: 200.w,
          height: 200.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.r),
            color: whiteColor,
          ),
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: blackColor),
                ),
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: TextFormField(
                  controller: titleController,
                  style: const TextStyle(color: blackColor),
                  decoration: const InputDecoration(
                    filled: true,
                    hintText: "Enter folder name",
                    fillColor: whiteColor,
                    border: InputBorder.none,
                  ),
                ),
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SmallCustomButton(
                    onTap: () => Get.back(),
                    title: 'Cancel',
                  ),
                  SmallCustomButton(
                    onTap: () {
                      newTitle = titleController.text.trim();
                      if (!customWhiteButtons.contains(newTitle)) {
                        setState(() {
                          customWhiteButtons.add(newTitle);
                          Get.back();
                        });
                      } else {
                        AppConstants.errorToast(
                          message:
                              'The folder with name $newTitle already exists',
                        );
                      }
                    },
                    title: 'Create',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: whiteColor,
          title: const Text('Delete Folder'),
          content: const Text('Are you sure you want to delete this folder?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Remove the folder from the list
                setState(() {
                  customWhiteButtons.removeAt(index);
                });
                Navigator.of(context).pop();
              },
              child: const Text('Delete'),
            ),
          ],
        );
      },
    );
  }
}