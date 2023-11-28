import 'package:hive_flutter/hive_flutter.dart';
import 'package:oxford_vocabulary_app/models/myUser.dart';
import 'package:oxford_vocabulary_app/utilities/constants.dart';

class HiveService {
  HiveService() {
    openUserBox();
  }

  void init({
    List<TypeAdapter>? adapters,
    String? path,
  }) async {
    if (path != null) {
      Hive.init(path);
    } else {
      await Hive.initFlutter();
    }
    adapters?.forEach((TypeAdapter adapter) {
      adapter.runtimeType;
      Hive.registerAdapter(adapter);
    });
  }

  void storeUser(MyUser user) async {
    final userBox = Hive.box(userBoxName);
    await userBox.put(
      "user",
      user,
    );
  }

  void deleteUser() async {
    final userBox = Hive.box(userBoxName);
    await userBox.delete("user");
  }

  bool isLoggedIn() {
    final userBox = Hive.box(userBoxName);

    return userBox.isNotEmpty;
  }
}

void openUserBox() async {
  await Hive.openBox(userBoxName);
}
