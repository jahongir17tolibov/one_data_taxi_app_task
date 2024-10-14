import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart' as geo;
import 'package:location/location.dart';
import 'package:one_data_taxi_app_task/core/base/base_functions.dart';
import 'package:one_data_taxi_app_task/core/constants/images_constants.dart';
import 'package:one_data_taxi_app_task/feature/main/domain/repository/address_repository.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc({required this.repository}) : super(const HomeState()) {
    on<OnMapCreatedHomeEvent>(_onMapCreatedHomeEvent);
    on<OnListenLocationHomeEvent>(_onListenLocationHomeEvent);
    on<OnLocateCurrentPositionHomeEvent>(_onLocateCurrentPositionHomeEvent);
    on<OnPressTrackingDistanceHomeEvent>(_onEnableTrackingDistanceHomeEvent);
    on<OnPressWaitHomeEvent>(_onPressWaitHomeEvent);
    on<_TimerTickedHomeEvent>(_timerTickedEvent);
  }

  final AddressRepository repository;

  late YandexMapController _mapController;
  final Location location = Location.instance;
  static const Point _initialPoint = Point(latitude: 41.311300, longitude: 69.279773);
  StreamSubscription<int>? _timerSubscription;
  bool isCameraMovedFirstTime = true;

  FutureOr<void> _onMapCreatedHomeEvent(
    OnMapCreatedHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    _mapController = event.mapController;
    await _movingCamera(_initialPoint);
  }

  FutureOr<void> _onLocateCurrentPositionHomeEvent(
    OnLocateCurrentPositionHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    if (state.currentPoint != null) await _movingCamera(state.currentPoint!);
  }

  FutureOr<void> _onEnableTrackingDistanceHomeEvent(
    OnPressTrackingDistanceHomeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(isTrackingDistanceEnabled: !state.isTrackingDistanceEnabled));
    state.isTrackingDistanceEnabled ? _startTimer(emit) : _stopTimer(emit);
  }

  FutureOr<void> _onPressWaitHomeEvent(
    OnPressWaitHomeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(isPaused: !state.isPaused));
    state.isPaused ? _pauseTimer() : _resumeTimer();
  }

  FutureOr<void> _onListenLocationHomeEvent(
    OnListenLocationHomeEvent event,
    Emitter<HomeState> emit,
  ) async {
    _enableBackgroundLocation();
    const settings = geo.LocationSettings(distanceFilter: 10);
    await emit.onEach(
      geo.Geolocator.getPositionStream(locationSettings: settings),
      onData: (currentLocation) {
        final Point point = Point(
          latitude: currentLocation.latitude,
          longitude: currentLocation.longitude,
        );
        final double speed = currentLocation.speed * 3.6;

        emit(state.copyWith(currentPoint: point, speed: speed.toInt()));

        _cameraMovedToCurrentLocation(point);
        _calculateTotalDistance(currentLocation, emit);
        _getAddress(point, emit);
        _resumeWhenSpeedIncreases(emit);
        _updateMarkerPosition(point, emit);
      },
    );
  }

  void _resumeWhenSpeedIncreases(Emitter<HomeState> emit) {
    if (state.speed > 30) _resumeTimer();
  }

  FutureOr<void> _cameraMovedToCurrentLocation(Point point) async {
    if (isCameraMovedFirstTime) {
      await _movingCamera(point);
      isCameraMovedFirstTime = false;
    }
  }

  void _updateMarkerPosition(Point point, Emitter<HomeState> emit) {
    final updatedMapObjects = List<MapObject>.from(state.mapObjects);
    updatedMapObjects.clear();

    updatedMapObjects.add(
      PlacemarkMapObject(
        mapId: const MapObjectId('center_marker'),
        point: point,
        icon: getUserPlaceMarkIcon,
        opacity: 1.0,
        isDraggable: false,
      ),
    );
    emit(state.copyWith(mapObjects: updatedMapObjects));
  }

  PlacemarkIcon get getUserPlaceMarkIcon {
    final image = BitmapDescriptor.fromAssetImage(ImagesConstants.userMarker);
    final style = PlacemarkIconStyle(image: image, scale: 2.0);

    return PlacemarkIcon.single(style);
  }

  Future<void> _getAddress(Point point, Emitter<HomeState> emit) async {
    await repository.getAddressResult(point).then((result) {
      emit(state.copyWith(address: result.data ?? result.errorMessage!));
    });
  }

  void _calculateTotalDistance(geo.Position position, Emitter<HomeState> emit) {
    final previousDistance = state.previousPoint;
    if (previousDistance != null) {
      final double distance = geo.Geolocator.distanceBetween(
        previousDistance.latitude,
        previousDistance.longitude,
        position.latitude,
        position.longitude,
      );
      final double calculatedDistance = state.totalDistance + distance;
      final double formatedValue = double.tryParse(calculatedDistance.toStringAsFixed(2)) ?? 0.0;
      emit(state.copyWith(totalDistance: formatedValue));
    }
    emit(state.copyWith(
      previousPoint: Point(latitude: position.latitude, longitude: position.longitude),
    ));
  }

  Future<void> _movingCamera(Point point) async {
    const animation = MapAnimation(type: MapAnimationType.smooth, duration: 2.0);
    final CameraUpdate cameraUpdate = CameraUpdate.newCameraPosition(
      CameraPosition(target: point, zoom: 16),
    );
    await _mapController.moveCamera(cameraUpdate, animation: animation);
  }

  Future<void> _enableBackgroundLocation() async {
    final isEnabled = await location.enableBackgroundMode();
    if (!isEnabled) {
      await location.enableBackgroundMode();
    } else {
      printOnDebug('enabled');
    }
  }

  void _startTimer(Emitter<HomeState> emit) {
    final timerStream = Stream.periodic(const Duration(seconds: 1), (i) => i);
    _emitTimerStream(timerStream, emit);
  }

  void _stopTimer(Emitter<HomeState> emit) {
    _timerSubscription?.cancel();
    emit(state.copyWith(second: 0, isPaused: false));
  }

  void _resumeTimer() {
    if (_timerSubscription?.isPaused ?? false) {
      _timerSubscription?.resume();
    }
  }

  void _pauseTimer() {
    _timerSubscription?.pause();
  }

  void _emitTimerStream(Stream<int> stream, Emitter<HomeState> emit) {
    _timerSubscription = stream.listen((second) => add(_TimerTickedHomeEvent(second)));
  }

  FutureOr<void> _timerTickedEvent(
    _TimerTickedHomeEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(state.copyWith(second: event.seconds));
  }

  @override
  Future<void> close() {
    _timerSubscription?.cancel();
    return super.close();
  }
}
