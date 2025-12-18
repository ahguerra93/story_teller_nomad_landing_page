import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_teller_nomad_landing_page/injection.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/photo_collection/photo_collection.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/use_cases/get_all_photos.dart';

part 'photos_dashboard_cubit_state.dart';
part 'photos_dashboard_cubit_cubit.freezed.dart';

class PhotosDashboardCubitCubit extends Cubit<PhotosDashboardCubitState> {
  final GetAllPhotos _getAllPhotos;
  PhotosDashboardCubitCubit() : _getAllPhotos = getIt<GetAllPhotos>(), super(PhotosDashboardCubitState.loading());

  Future<void> load() async {
    final (photos, error) = await _getAllPhotos();
    if (error != null) {
      emit(PhotosDashboardCubitState.error(error.toString()));
      return;
    }

    if (photos == null) {
      emit(PhotosDashboardCubitState.error('No Photos found'));
      return;
    }

    emit(PhotosDashboardCubitState.success(photos));
  }
}
