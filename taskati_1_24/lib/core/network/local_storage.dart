import 'package:hive/hive.dart';

class AppLocal {
  static String IMAGE_KEY = 'IMAGE';
  static String NAME_KEY = 'NAME';
  static String ISUPLOAD_KEY = 'ISUPLOAD';
  static cacheData(String key, value) {
    var box = Hive.box('user');
    box.put(key, value);
  }

  static dynamic getCachedData(String key) {
    var box = Hive.box('user');
    return box.get(key);
  }
}
