class Definition {
  String? meaning;
  List<String>? examples;

  Definition({
    this.meaning,
    this.examples,
  });

  Definition.fromJson(Map<String, dynamic> json) {
    meaning = json['meaning'];
    examples = json['examples'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['meaning'] = meaning;
    data['examples'] = examples;
    return data;
  }
}
