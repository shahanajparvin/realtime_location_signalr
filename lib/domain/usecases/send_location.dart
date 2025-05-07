import 'package:injectable/injectable.dart';
import 'package:realtime_location_signalr/domain/repositories/location_repository.dart';


@Injectable()
class SendLocation {
  final LocationRepository repository;

  SendLocation(this.repository);

  Future<void> call(double lat, double lon) async {
    await repository.sendLocation(lat, lon);
  }
}
