import 'package:injectable/injectable.dart';
import 'package:realtime_location_signalr/domain/entities/location.dart';
import 'package:signalr_core/signalr_core.dart';

import 'signalr_service.dart';


@LazySingleton(as: SignalRService)
class SignalRServiceImpl implements SignalRService {
  late HubConnection _connection;
  bool _connected = false;

  Function(bool)? _connectionStatusListener;

  @override
  void onConnectionStatusChanged(Function(bool) callback) {
    _connectionStatusListener = callback;
  }

  @override
  bool get isConnected => _connected;

  @override
  Future<void> connect() async {
    _connection = HubConnectionBuilder()
        .withUrl(
      'http://contest-api.devdata.top/Hub',
      HttpConnectionOptions(logging: (level, message) => print(message)),
    )
        .build();

    _connection.onclose((error) {
      _connected = false;
      _connectionStatusListener?.call(false); // notify disconnection
    });

    await _connection.start();
    _connected = true;
    _connectionStatusListener?.call(true); // notify connection

  }

  @override
  Future<void> disconnect() async {

    await _connection.stop();
    _connected = false;
    _connectionStatusListener?.call(false); // notify disconnection
  }

  @override
  Future<void> sendLatLon(double lat, double lon) async {
    if (_connected) {
      await _connection.invoke("SendLatLon", args: [lat, lon]);
    }
  }

  @override
  Future<void> onReceiveLatLon(Function(Location) callback) async {
    if (_connected) {
      _connection.on("ReceiveLatLon", (args) {
        final lat = args?[0] as double;
        final lon = args?[1] as double;
        callback(Location(latitude: lat, longitude: lon));
      });
    }
  }
}