import 'package:hive_flutter/hive_flutter.dart';

part 'myUser.g.dart';

@HiveType(typeId: 1)
class MyUser {
  MyUser({
    required this.email,
    this.uid,
    this.displayName,
    this.photoUrl,
  });

  @HiveField(0)
  String? uid;

  @HiveField(1)
  final String? email;

  @HiveField(2)
  final String? displayName;

  @HiveField(3)
  final String? photoUrl;

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "displayName": displayName,
      "photoUrl": photoUrl,
    };
  }
}
