import 'package:freezed_annotation/freezed_annotation.dart';

enum MediaType {
  @JsonValue('photo')
  photo,
  @JsonValue('video')
  video,
}
