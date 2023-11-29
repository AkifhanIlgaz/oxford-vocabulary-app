import 'package:hive/hive.dart';
import 'package:oxford_vocabulary_app/models/myUser.dart';
import 'package:oxford_vocabulary_app/utilities/constants.dart';

class HiveService {
  void storeUser(MyUser user) async {
    final userBox = Hive.box<MyUser>(userBoxName);
    await userBox.put(
      "user",
      user,
    );
  }

  void deleteUser() async {
    final userBox = Hive.box<MyUser>(userBoxName);
    await userBox.delete("user");
  }

  MyUser? getUser() {
    final userBox = Hive.box<MyUser>(userBoxName);
    return userBox.get("user");
  }

  bool isLoggedIn() {
    final userBox = Hive.box<MyUser>(userBoxName);
    return userBox.isNotEmpty;
  }

  String? get photoUrl {
    final userBox = Hive.box<MyUser>(userBoxName);
    return userBox.get("user")?.photoUrl;
  }
}
