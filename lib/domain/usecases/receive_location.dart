import 'package:injectable/injectable.dart';
import 'package:realtime_location_signalr/domain/entities/location.dart';
import 'package:realtime_location_signalr/domain/repositories/location_repository.dart';


@Injectable()
class ReceiveLocation {
  final LocationRepository repository;

  ReceiveLocation(this.repository);

  Future<void> connect() async {
    await repository.connect();
  }

  void receiveLocation(Function(Location) callback) {
    repository.receiveLocation(callback);
  }
}
