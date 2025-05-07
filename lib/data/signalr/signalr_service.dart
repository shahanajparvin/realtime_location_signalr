import 'package:realtime_location_signalr/domain/entities/location.dart';

abstract class SignalRService {
  Future<void> connect();
  Future<void> disconnect();
  Future<void> sendLatLon(double lat, double lon);
  Future<void> onReceiveLatLon(Function(Location) callback);
  bool get isConnected;
  void onConnectionStatusChanged(Function(bool) callback); // <-- add this
}