import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  void init({List<TypeAdapter>? adapters, String? path}) async {
    if (path != null) {
      Hive.init(path);
    } else {
      await Hive.initFlutter();
    }

    adapters?.forEach((TypeAdapter adapter) {
      Hive.registerAdapter(adapter);
    });
  }

  
}
