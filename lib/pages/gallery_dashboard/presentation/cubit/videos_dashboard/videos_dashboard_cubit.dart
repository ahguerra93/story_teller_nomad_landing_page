import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_teller_nomad_landing_page/injection.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/models/video_collection/video_collection.dart';
import 'package:story_teller_nomad_landing_page/pages/media_gallery/domain/use_cases/get_all_videos.dart';

part 'videos_dashboard_state.dart';
part 'videos_dashboard_cubit.freezed.dart';

class VideosDashboardCubit extends Cubit<VideosDashboardState> {
  final GetAllVideos _getAllVideos;
  VideosDashboardCubit() : _getAllVideos = getIt<GetAllVideos>(), super(VideosDashboardState.loading());

  Future<void> load() async {
    emit(VideosDashboardState.loading());
    final (result, error) = await _getAllVideos();
    if (error != null) {
      emit(VideosDashboardState.error(error.toString()));
    } else if (result == null) {
      emit(VideosDashboardState.error("No videos found"));
    } else {
      emit(VideosDashboardState.success(result));
    }
  }
}
