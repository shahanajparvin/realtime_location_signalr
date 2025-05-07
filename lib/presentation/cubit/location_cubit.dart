
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:realtime_location_signalr/domain/entities/location.dart';
import 'package:realtime_location_signalr/domain/usecases/receive_location.dart';
import 'package:realtime_location_signalr/domain/usecases/send_location.dart';

part 'location_state.dart';

@Injectable()
class LocationCubit extends Cubit<LocationState> {
  final SendLocation sendLocation;
  final ReceiveLocation receiveLocation;

  LocationCubit(this.sendLocation, this.receiveLocation) : super(LocationInitial());

  void sendLatLon(double lat, double lon) async {
    try {
      emit(LocationLoading());
      await sendLocation.call(lat, lon);
      emit(LocationSent());
    } catch (e) {
      emit(LocationError("Failed to send location"));
    }
  }

  Future<void> connect() async {
    await receiveLocation.connect(); // This connects the SignalR service.
    receiveLocation.receiveLocation((location) {
      emit(LocationReceived(location));
    });
  }



}
