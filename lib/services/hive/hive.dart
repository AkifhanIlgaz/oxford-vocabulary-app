import 'package:hive_flutter/hive_flutter.dart';
import 'package:oxford_vocabulary_app/models/myUser.dart';

class HiveService {
  String get userBox => "userBox";

  void init({
    List<TypeAdapter>? adapters,
    String? path,
    required List<String> boxes,
  }) async {
    if (path != null) {
      Hive.init(path);
    } else {
      await Hive.initFlutter();
    }
    adapters?.forEach((TypeAdapter adapter) {
      Hive.registerAdapter(adapter);
    });

    for (final box in boxes) {
      await Hive.openBox(box);
    }
  }

  void storeUser(MyUser user) async {
    final userBox = Hive.box("userBox");
    await userBox.put(
      "user",
      user,
    );
  }

  void deleteUser() async {
    final userBox = Hive.box("userBox");
    await userBox.delete("user");
  }

  bool isLoggedIn() {
    final userBox = Hive.box("userBox");

    return userBox.isNotEmpty;
  }
}
