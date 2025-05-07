import 'package:injectable/injectable.dart';
import 'package:realtime_location_signalr/domain/repositories/location_repository.dart';

@LazySingleton()
class ListenToConnectionStatus {
  final LocationRepository repository;

  ListenToConnectionStatus(this.repository);

  void call(Function(bool) onStatusChanged) {
    repository.listenToConnectionChanges(onStatusChanged);
  }
}
