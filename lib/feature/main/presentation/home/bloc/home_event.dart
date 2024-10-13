part of 'home_bloc.dart';

sealed class HomeEvent {}

final class OnListenLocationHomeEvent extends HomeEvent {}

final class OnMapCreatedHomeEvent extends HomeEvent {
  OnMapCreatedHomeEvent(this.mapController);

  final YandexMapController mapController;
}

final class OnCameraPositionChangedHomeEvent extends HomeEvent {
  OnCameraPositionChangedHomeEvent(this.position);

  final CameraPosition position;
}

final class OnLocateCurrentPositionHomeEvent extends HomeEvent {}

final class OnPressTrackingDistanceHomeEvent extends HomeEvent {}

final class OnPressWaitHomeEvent extends HomeEvent {}

final class OnAppPausedHomeEvent extends HomeEvent {}

final class _TimerTickedHomeEvent extends HomeEvent {
  _TimerTickedHomeEvent(this.seconds);

  final int seconds;
}
