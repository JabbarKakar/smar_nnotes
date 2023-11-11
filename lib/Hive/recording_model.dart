
import 'package:hive/hive.dart';
part 'recording_model.g.dart';

@HiveType(typeId: 0)
class AudioModel {
  @HiveField(0)
  final String audioPath;

  AudioModel(this.audioPath);
}