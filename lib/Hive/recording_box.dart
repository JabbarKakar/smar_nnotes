

import 'package:hive/hive.dart';
import 'package:smar_notes/Hive/recording_model.dart';

class RecordingBox {
  static Box<AudioModel> getRecordings() => Hive.box<AudioModel>('audioBox');
}