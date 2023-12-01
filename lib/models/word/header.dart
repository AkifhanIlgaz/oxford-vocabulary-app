import 'package:oxford_vocabulary_app/models/word/audio.dart';

class Header {
  Audio? audio;
  String? partOfSpeech;
  String? cEFRLevel;

  Header({this.audio, this.partOfSpeech, this.cEFRLevel});

  Header.fromJson(Map<String, dynamic> json) {
    audio = json['audio'] != null ? Audio.fromJson(json['audio']) : null;
    partOfSpeech = json['partOfSpeech'];
    cEFRLevel = json['CEFRLevel'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (audio != null) {
      data['audio'] = audio!.toJson();
    }
    data['partOfSpeech'] = partOfSpeech;
    data['CEFRLevel'] = cEFRLevel;
    return data;
  }
}
