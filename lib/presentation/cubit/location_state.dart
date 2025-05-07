part of 'location_cubit.dart';

abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationSent extends LocationState {}

class LocationReceived extends LocationState {
  final Location location;

  LocationReceived(this.location);
}

class LocationError extends LocationState {
  final String message;

  LocationError(this.message);
}
