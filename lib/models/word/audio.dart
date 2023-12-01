class Audio {
  String? UK;
  String? US;

  Audio({this.UK, this.US});

  Audio.fromJson(Map<String, dynamic> json) {
    UK = json['UK'];
    US = json['US'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UK'] = UK;
    data['US'] = US;
    return data;
  }
}
