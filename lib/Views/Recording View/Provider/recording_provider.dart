import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'package:record/record.dart';

import '../../../Hive/recording_box.dart';
import '../../../Hive/recording_model.dart';

class RecordingProvider with ChangeNotifier {
  Record audioRecord = Record();
  AudioPlayer audioPlayer = AudioPlayer();
  bool isRecording = false;
  String audioPath = '';

  Future<void> startRecording() async {
    try {
      if (await audioRecord.hasPermission()) {
        await audioRecord.start();
        isRecording = true;
        notifyListeners();
      }
    } catch (e) {
      print('Error Start Recording: $e');
    }
  }

  Future<void> stopRecording() async {
    try {
      String? path = await audioRecord.stop();
      isRecording = false;
      audioPath = path!;
      notifyListeners();
      await saveAudioToStorage(path);
    } catch (e) {
      print('Error stop Recording $e');
      print('Error stop Recording $audioPath');
    }
  }

  Future<void> saveAudioToStorage(String audioFilePath) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final savedFilePath = '${directory.path}/recorded_audio.mp3';

      final audioFile = File(audioFilePath);
      final savedFile = await audioFile.copy(savedFilePath);

      print('Saved audio file: ${savedFile.path}');
      if (await File(savedFilePath).exists()) {
        final box = RecordingBox.getRecordings();
            box.add(AudioModel(savedFilePath));
        // put('audioBox', AudioModel(savedFilePath))
        print('Audio file exists in storage>>>>>>>>>>>>>>>>>>>.');
      } else {
        print('Audio file does not exist in storage.');
      }
    } catch (e) {
      print('Error saving audio to storage: $e');
    }
  }

  Future<void> playRecording() async {
    Source urlSource = UrlSource(audioPath);
    try {
      await audioPlayer.play(urlSource);
    } catch (e) {
      print('Error Playing Recording $e');
    }
  }

}










