import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_location_signalr/presentation/cubit/connection_status_cubit.dart';


class ConnectionStatusWidget extends StatelessWidget {

  const ConnectionStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<ConnectionStatusCubit, ConnectionStatus>(
      builder: (context, state) {
        if (state == ConnectionStatus.connected) {
          return const Text('🟢 Connected');
        } else if (state == ConnectionStatus.disconnected) {
          return const Text('🔴 Disconnected');
        } else {
          return const Text('🟠 Connecting...');
        }
      },
    );
  }
}
