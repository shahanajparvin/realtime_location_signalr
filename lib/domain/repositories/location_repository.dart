import 'package:realtime_location_signalr/domain/entities/location.dart';


abstract class LocationRepository {
  Future<void> connect();
  Future<void> sendLocation(double lat, double lon);
  Future<void> receiveLocation(Function(Location) callback);
  Future<void> disconnect(); // optional
  bool get isConnected;
  void listenToConnectionChanges(Function(bool) callback); // <-- add this
}
