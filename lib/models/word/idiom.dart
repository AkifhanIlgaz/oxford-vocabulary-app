import 'package:oxford_vocabulary_app/models/word/definition.dart';

class Idiom {
  String? usage;
  List<Definition>? definition;

  Idiom({
    this.usage,
    this.definition,
  });

  Idiom.fromJson(Map<String, dynamic> json) {
    usage = json['usage'];
    if (json['definition'] != null) {
      definition = <Definition>[];
      json['definition'].forEach((v) {
        definition!.add(Definition.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['usage'] = usage;
    if (definition != null) {
      data['definition'] = definition!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
