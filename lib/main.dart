import 'package:flutter/material.dart';
import 'package:realtime_location_signalr/core/di/injector.dart';
import 'package:realtime_location_signalr/presentation/ui/screen/location_sharing_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SignalR Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  LocationSharingScreen(),
    );
  }
}


