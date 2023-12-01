import 'package:oxford_vocabulary_app/models/word/definition.dart';
import 'package:oxford_vocabulary_app/models/word/header.dart';
import 'package:oxford_vocabulary_app/models/word/idiom.dart';

class Word {
  int? id;
  int? box;
  String? source;
  String? word;
  Header? header;
  List<Definition>? definitions;
  List<Idiom>? idioms;

  Word(
      {this.id,
      this.box,
      this.source,
      this.word,
      this.header,
      this.definitions,
      this.idioms});

  Word.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    box = json['box'];
    source = json['source'];
    word = json['word'];
    header = json['header'] != null ? Header.fromJson(json['header']) : null;
    if (json['definitions'] != null) {
      definitions = <Definition>[];
      json['definitions'].forEach((v) {
        definitions!.add(Definition.fromJson(v));
      });
    }
    if (json['idioms'] != null) {
      idioms = <Idiom>[];
      json['idioms'].forEach((v) {
        idioms!.add(Idiom.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['box'] = box;
    data['source'] = source;
    data['word'] = word;
    if (header != null) {
      data['header'] = header!.toJson();
    }
    if (definitions != null) {
      data['definitions'] = definitions!.map((v) => v.toJson()).toList();
    }
    if (idioms != null) {
      data['idioms'] = idioms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
