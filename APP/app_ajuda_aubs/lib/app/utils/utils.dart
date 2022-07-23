import 'dart:convert';
import 'dart:math';

class UtilsData {
  static final Random _random = Random.secure();

  // ignore: non_constant_identifier_names
  static String GerarProtocolo([int length = 32]) {
    var values = List<int>.generate(length, (i) => _random.nextInt(256));
    return base64Url.encode(values);
  }
}
