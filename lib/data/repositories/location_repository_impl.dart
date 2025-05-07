

import 'package:injectable/injectable.dart';
import 'package:realtime_location_signalr/data/signalr/signalr_service.dart';
import 'package:realtime_location_signalr/domain/entities/location.dart';
import 'package:realtime_location_signalr/domain/repositories/location_repository.dart';

@LazySingleton(as: LocationRepository)
class LocationRepositoryImpl implements LocationRepository {
  final SignalRService signalRService;

  LocationRepositoryImpl(this.signalRService);

  @override
  Future<void> sendLocation(double lat, double lon) async {
    await signalRService.sendLatLon(lat, lon);
  }

  @override
  Future<void> receiveLocation(Function(Location) callback) async {
    await signalRService.onReceiveLatLon(callback);
  }

  @override
  Future<void> connect() async {
    await signalRService.connect();
  }

  @override
  Future<void> disconnect() => signalRService.disconnect();

  @override
  bool get isConnected => signalRService.isConnected;

  @override
  void listenToConnectionChanges(Function(bool) callback) {
    signalRService.onConnectionStatusChanged(callback);
  }
}
