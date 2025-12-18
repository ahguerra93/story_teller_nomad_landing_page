part of 'photos_dashboard_cubit_cubit.dart';

@freezed
class PhotosDashboardCubitState with _$PhotosDashboardCubitState {
  const factory PhotosDashboardCubitState.loading() = _Loading;
  const factory PhotosDashboardCubitState.success(PhotoCollection photoCollection) = _Success;
  const factory PhotosDashboardCubitState.error(String message) = _Error;
}
