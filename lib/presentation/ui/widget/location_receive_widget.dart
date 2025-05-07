import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_location_signalr/domain/entities/location.dart';
import 'package:realtime_location_signalr/presentation/cubit/location_cubit.dart';

class LocationReceivedWidget extends StatelessWidget {
  const LocationReceivedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        if (state is LocationLoading) {
          return CircularProgressIndicator();
        } else if (state is LocationSent) {
          return Text("Location sent!");
        } else if (state is LocationReceived) {
          final Location location = state.location;
          return Text("Received Location: Lat: ${location.latitude}, Lon: ${location.longitude}");
        } else if (state is LocationError) {
          return Text(state.message);
        } else {
          return Text("No location received yet.");
        }
      },
    );
  }
}
