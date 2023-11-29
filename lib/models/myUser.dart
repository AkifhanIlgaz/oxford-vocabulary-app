import 'package:hive_flutter/hive_flutter.dart';

part 'myUser.g.dart';

@HiveType(typeId: 1)
class MyUser {
  MyUser(
      {required this.uid,
      required this.email,
      this.displayName,
      this.profileImageUrl});

  @HiveField(0)
  final String uid;

  @HiveField(1)
  final String email;

  @HiveField(2)
  final String? displayName;

  @HiveField(3)
  final String? profileImageUrl;
}
