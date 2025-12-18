part of 'videos_dashboard_cubit.dart';

@freezed
class VideosDashboardState with _$VideosDashboardState {
  const factory VideosDashboardState.loading() = _Initial;
  const factory VideosDashboardState.error(String message) = _Error;
  const factory VideosDashboardState.success(VideoCollection videoCollection) = _Success;
}
