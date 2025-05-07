import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:realtime_location_signalr/domain/usecases/listen_to_connection_status.dart';

enum ConnectionStatus {
  connecting,
  connected,
  disconnected,
}

@Injectable()
class ConnectionStatusCubit extends Cubit<ConnectionStatus> {
  final ListenToConnectionStatus listenToConnectionStatus;

  ConnectionStatusCubit(this.listenToConnectionStatus)
      : super(ConnectionStatus.connecting) {
    startListening();
  }

  void startListening() {
    listenToConnectionStatus((isConnected) {
      if (isConnected) {
        emit(ConnectionStatus.connected);
      } else {
        emit(ConnectionStatus.disconnected);
      }
    });
  }
}


