import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_location_signalr/core/di/injector.dart';
import 'package:realtime_location_signalr/presentation/cubit/connection_status_cubit.dart';
import 'package:realtime_location_signalr/presentation/cubit/location_cubit.dart';
import 'package:realtime_location_signalr/presentation/ui/widget/location_receive_widget.dart';
import 'package:realtime_location_signalr/presentation/ui/widget/location_update_form.dart';

import '../widget/connection_status_widget.dart';

class LocationSharingScreen extends StatefulWidget {
  const LocationSharingScreen({super.key});

  @override
  State<LocationSharingScreen> createState() => _LocationSharingScreenState();
}

class _LocationSharingScreenState extends State<LocationSharingScreen> {
  final LocationCubit locationCubit = injector();
  final ConnectionStatusCubit connectionStatusCubit = injector();

  @override
  void initState() {
    super.initState();
    locationCubit.connect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleTextStyle: TextStyle(color: Colors.white,fontSize: 18),
        backgroundColor: Colors.green,
        title: Text("Real-Time Location Sharing"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MultiBlocProvider(
          providers: [
            BlocProvider<LocationCubit>(create: (_) => locationCubit),
            BlocProvider<ConnectionStatusCubit>(
              create: (_) => connectionStatusCubit,
            ),
          ],
          child: Column(
            children: [
              ConnectionStatusWidget(),
              LocationUpdateForm(),
              SizedBox(height: 20),
              LocationReceivedWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
