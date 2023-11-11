import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:smar_notes/Views/Profile%20VIew/profile_view.dart';
import 'package:smar_notes/Views/new_screen.dart';
import 'package:smar_notes/Widgets/custom_app_bar.dart';

import '../../Utils/app_colors.dart';
import '../../Utils/app_constants.dart';
import '../../Utils/app_images.dart';
import '../../Utils/app_text.dart';
import '../../Widgets/main_body_container.dart';
import '../../Widgets/main_drawer.dart';
import '../../Widgets/start_recording.dart';
import '../../Widgets/stepper_widget.dart';
import '../../Widgets/stop_recording.dart';

import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';

import 'Provider/recording_provider.dart';

final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

class RecordingView extends StatefulWidget {
  const RecordingView({super.key});

  @override
  State<RecordingView> createState() => _RecordingViewState();
}

class _RecordingViewState extends State<RecordingView> {
  bool showFirstColumn = true;

  void toggleColumnVisibility() {
    setState(() {
      showFirstColumn = !showFirstColumn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: CustomAppBar(
        text: 'RECORDER',
        onTapMenu: () {
          scaffoldKey.currentState!.openDrawer();
        },
        onTapProfile: () {
          Get.to(() => const ProfileView());
        },
      ),
      drawer: const MainDrawer(),
      body: MainBodyContainer(
        child: Consumer<RecordingProvider>(
          builder: (context, recordingProvider, child) {
            return Column(
              children: [
                if (showFirstColumn)
                  StopRecording(onTap: () {
                    toggleColumnVisibility();
                    recordingProvider.startRecording();
                  }),
                if (!showFirstColumn)
                  StartRecording(onTap: () {
                    toggleColumnVisibility();
                    // addStepperWidget();
                    recordingProvider.stopRecording();
                  }),
                // TextButton(
                //     onPressed: () {
                //       //recordingProvider.playRecording[index];
                //     },
                //     child: const Text(
                //       "Play",
                //       style: TextStyle(color: Colors.white, fontSize: 36),
                //     ))
              ],
            );
          },
        ),
      ),
    );
  }
}

// void addStepperWidget() {
//   setState(() {
//     AppConstants.stepperWidgets.add(StepperWidget(
//         serialNum: AppConstants.stepperWidgets.length.toString()));
//   });
// }

// late Record audioRecord;
// late AudioPlayer audioPlayer;
// bool isRecording = false;
// String audioPath = '';
//
// @override
// void initState() {
//   super.initState();
//   audioRecord = Record();
//   audioPlayer = AudioPlayer();
// }
//
// @override
// void dispose() {
//   audioRecord.dispose();
//   audioPlayer.dispose();
//   super.dispose();
// }
//
// Future<void> startRecording() async {
//   try {
//     if (await audioRecord.hasPermission()) {
//       await audioRecord.start();
//       setState(() {
//         isRecording = true;
//       });
//     }
//   } catch (e, stackTrace) {
//     print('Error Start Recording::::::: $e');
//     print('Stack Trace:::::::>>>>>>> $stackTrace');
//   }
// }
//
// Future<void> stopRecording() async {
//   try {
//     String? path = await audioRecord.stop();
//     setState(() {
//       isRecording = false;
//       audioPath = path!;
//     });
//
//     // Save the recorded audio to mobile storage
//     await _saveAudioToStorage(path!);
//   } catch (e) {
//     print('Error stop Recording $e');
//   }
// }
//
// Future<void> playRecording() async {
//   try {
//     Source urlSource = UrlSource(audioPath);
//     await audioPlayer.play(urlSource);
//   } catch (e) {
//     print('Error Playing Recording $e');
//   }
// }
//
// Future<void> _saveAudioToStorage(String audioFilePath) async {
//   try {
//     final directory = await getApplicationDocumentsDirectory();
//     final savedFilePath = '${directory.path}/recorded_audio.mp3';
//
//     final File audioFile = File(audioFilePath);
//     final savedFile = await audioFile.copy(savedFilePath);
//
//     print('Saved audio file: ${savedFile.path}');
//     Get.snackbar(
//       'Audio Saved!',
//       'Saved audio file: ${savedFile.path}',
//       colorText: Colors.white,
//       isDismissible: true,
//       backgroundColor: Colors.white,
//     );
//
//     if (await File(savedFilePath).exists()) {
//       print('Audio file exists in storage.');
//     } else {
//       print('Audio file does not exist in storage.');
//     }
//   } catch (e) {
//     print('Error saving audio to storage: $e');
//   }
// }
