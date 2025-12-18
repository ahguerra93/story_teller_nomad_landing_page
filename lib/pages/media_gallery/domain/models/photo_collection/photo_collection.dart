import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_item.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/media_item/media_type.dart';

part 'photo_collection.freezed.dart';
part 'photo_collection.g.dart';

@freezed
abstract class PhotoCollection with _$PhotoCollection {
  const factory PhotoCollection({@Default([]) List<MediaItem> commercial, @Default([]) List<MediaItem> personal}) =
      _PhotoCollection;

  factory PhotoCollection.fromJson(Map<String, dynamic> json) => _$PhotoCollectionFromJson(json);

  const PhotoCollection._();

  List<MediaItem> get all => [...commercial, ...personal];
  List<MediaItem> get intertwined {
    final maxLength = commercial.length > personal.length ? commercial.length : personal.length;

    List<MediaItem> intertwinedList = [];

    for (int i = 0; i < maxLength; i++) {
      // Add commercial item or empty placeholder
      if (i < commercial.length) {
        intertwinedList.add(commercial[i]);
      } else {
        intertwinedList.add(MediaItem(id: '', title: '', type: MediaType.photo));
      }

      // Add personal item or empty placeholder
      if (i < personal.length) {
        intertwinedList.add(personal[i]);
      } else {
        intertwinedList.add(MediaItem(id: '', title: '', type: MediaType.photo));
      }
    }
    return intertwinedList;
  }
}
