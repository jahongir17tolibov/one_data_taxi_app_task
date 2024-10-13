part of 'home_bloc.dart';

enum HomeStatus { pure, onLoading, onSuccess, onTimerStart, onTimerStop, onShowMessage }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.pure,
    this.previousPoint,
    this.totalDistance = 0.0,
    this.currentPoint,
    this.address = '',
    this.isTrackingDistanceEnabled = false,
    this.isPaused = false,
    this.second = 0,
    this.speed = 0,
    this.mapObjects = const [],
  });

  final HomeStatus status;
  final Point? previousPoint;
  final Point? currentPoint;
  final double totalDistance;
  final String address;
  final int second;
  final int speed;
  final bool isTrackingDistanceEnabled;
  final bool isPaused;
  final List<MapObject> mapObjects;

  HomeState copyWith({
    HomeStatus? status,
    Point? previousPoint,
    Point? currentPoint,
    String? address,
    double? totalDistance,
    int? second,
    int? speed,
    bool? isTrackingDistanceEnabled,
    bool? isPaused,
    List<MapObject>? mapObjects,
  }) =>
      HomeState(
        status: status ?? this.status,
        previousPoint: previousPoint ?? this.previousPoint,
        currentPoint: currentPoint ?? this.currentPoint,
        totalDistance: totalDistance ?? this.totalDistance,
        address: address ?? this.address,
        second: second ?? this.second,
        speed: speed ?? this.speed,
        isTrackingDistanceEnabled: isTrackingDistanceEnabled ?? this.isTrackingDistanceEnabled,
        isPaused: isPaused ?? this.isPaused,
        mapObjects: mapObjects ?? this.mapObjects,
      );

  @override
  List<Object?> get props => [
        status,
        previousPoint,
        currentPoint,
        totalDistance,
        address,
        speed,
        second,
        isTrackingDistanceEnabled,
        isPaused,
        mapObjects,
      ];
}
