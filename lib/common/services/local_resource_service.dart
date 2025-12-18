import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

class LocalResourceService {
  Future<Map<String, dynamic>> loadJsonData(String path) async {
    final String response = await rootBundle.loadString(path);
    return json.decode(response);
  }
}
