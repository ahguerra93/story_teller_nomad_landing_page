import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';

class GalleryService {
  final _functions = FirebaseFunctions.instance;

  Future<List<String>> fetchImages() async {
    try {
      final callable = _functions.httpsCallable('getGallery');
      final response = await callable();
      log(response.data.toString());
      List<String> result = [];
      (response.data as Map).forEach(
        (key, value) {
          log('Key: $key, Value: $value');
          result.add(value.toString());
        },
      );
      return result;
    } catch (e) {
      log('Error fetching images: $e');
      return [];
    }
  }
}
