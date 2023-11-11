import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:smar_notes/Utils/app_colors.dart';
import 'package:smar_notes/Utils/app_text.dart';
import 'package:smar_notes/Views/Recording%20View/Provider/recording_provider.dart';
import 'package:smar_notes/Widgets/custom_app_bar.dart';
import 'package:smar_notes/Widgets/main_body_container.dart';
import 'package:smar_notes/Widgets/main_drawer.dart';

import '../Hive/recording_box.dart';
import '../Hive/recording_model.dart';
import '../Utils/app_constants.dart';
import '../Widgets/stepper_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class NewScreen extends StatefulWidget {
  const NewScreen({
    super.key,
  });

  @override
  State<NewScreen> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  void addStepperWidget() {
    setState(() {
      AppConstants.stepperWidgets.add(StepperWidget(
          serialNum: AppConstants.stepperWidgets.length.toString()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        text: 'My Recordings',
        onTapMenu: () {
          scaffoldKey.currentState!.openDrawer();
        },
        onTapProfile: () {},
      ),
      drawer: const MainDrawer(),
      body: MainBodyContainer(
        child: Consumer<RecordingProvider>(
          builder: (context, recordingProvider, child) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 40.h),
              child: ValueListenableBuilder<Box<AudioModel>>(
                valueListenable: RecordingBox.getRecordings().listenable(),
                builder: (BuildContext context, box, _) {
                  var data = box.values.toList().cast<AudioModel>();
                  return RecordingBox.getRecordings().isNotEmpty
                      ? ListView.builder(
                          itemCount: RecordingBox.getRecordings().length,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: Container(
                                height: 70.h,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(15.r)),
                                child: ListTile(
                                  leading: InkWell(
                                      onTap: () {
                                        recordingProvider.playRecording();
                                      },
                                      child: const Icon(Icons.play_arrow)),
                                  title: Text(
                                    data[index].audioPath.toString(),
                                    style: TextStyle(color: blackColor, fontSize: 10.sp),
                                  ),
                                ),
                              ),
                            );
                          },
                        )
                      : const Text20(
                          text: 'No Recordings',
                          color: whiteColor,
                        );
                },
              ),
            );
          },
        ),
      ),
    );

    //   Scaffold(
    //   body: SafeArea(
    //     child: MainBodyContainer(
    //       child: Padding(
    //         padding: EdgeInsets.symmetric(horizontal: 8.w),
    //         child: Column(
    //             children: [
    //           SizedBox(
    //             height: 300.h,
    //             child: ListView.builder(
    //               itemCount: widget.stepperWidget.length,
    //               itemBuilder: (context, index) {
    //                 return widget.stepperWidget[index];
    //               },
    //             ),
    //           ),
    //
    //         ]),
    //       ),
    //     ),
    //   ),
    //   floatingActionButton: CustomFAB(
    //     onTap: () {
    //       addStepperWidget();
    //     },
    //   ),
    // );
  }
  // Future<String?> getAudioPath() async {
  //   final audioBox = Hive.box<AudioModel>('audioBox');
  //   final audioModel = audioBox.get('recorded_audio');
  //   return audioModel?.audioPath;
  // }
}
