import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smar_notes/Utils/app_constants.dart';
import 'package:smar_notes/Views/Profile%20VIew/profile_view.dart';
import 'package:smar_notes/Widgets/custom_fab.dart';
import 'package:smar_notes/Widgets/main_body_container.dart';
import 'package:smar_notes/Widgets/main_drawer.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_text.dart';
import '../../Widgets/custom_app_bar.dart';
import '../../Widgets/custom_list_tile.dart';
import '../../Widgets/small_custom_button.dart';
import '../Notes Details View/notes_details_view.dart';
import '../Recording View/recording_view.dart';
import '../Workbech View/workbench_view.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class NotesList extends StatefulWidget {
  final String title;
  const NotesList({super.key, required this.title});

  @override
  State<NotesList> createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  List<String> titles = [
    'Note 1 | Date: 29.10.2023 |\nLocation: Frankfurt',
    'Note 2',
    'Note 3',
    'Note 4',
    'Note 5',
    'Note 6',
    'Note 7',
    'Note 8',
    'Note 9',
    'Note 10',
    'Note 11',
    'Note 12',
  ];

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
        },
      ),
      drawer: const MainDrawer(),
      body: MainBodyContainer(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
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
                      onTap: () {},
                    ),
                  ],
                ),
                40.ht,
                ListView.builder(
                  itemCount: titles.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CustomListTile(
                      title: titles[index],
                      onTapTile: () {
                        Get.to(() => NotesDetailsView(title: titles[index].toString(),) );
                      },
                      onTapEdit: () {
                        Get.to(() => WorkbenchView(title: titles[index].toString(), details: details,) );
                      },
                    );
                  },
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
}


