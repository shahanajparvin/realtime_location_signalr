
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:realtime_location_signalr/presentation/cubit/connection_status_cubit.dart';
import 'package:realtime_location_signalr/presentation/cubit/location_cubit.dart';

class LocationUpdateForm extends StatefulWidget {
  const LocationUpdateForm({super.key});

  @override
  State<LocationUpdateForm> createState() => _LocationUpdateFormState();
}

class _LocationUpdateFormState extends State<LocationUpdateForm> {
  final TextEditingController latController = TextEditingController();
  final TextEditingController lonController = TextEditingController();

  Country? selectedCountry;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        Text('Please update your location from below drop down'),
        SizedBox(height: 20,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[100], // optional background color
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey.shade400,
              width: 1.2,
            ),
          ),
          child: DropdownButton<Country>(
            hint: Text("Select a place"),
            value: selectedCountry,
            isExpanded: true,
            underline: SizedBox(), // removes default underline
            onChanged: (Country? country) {
              if (country != null) {
                setState(() {
                  selectedCountry = country;
                  latController.text = country.latitude.toString();
                  lonController.text = country.longitude.toString();
                });
              }
            },
            items: placeList.map((Country country) {
              return DropdownMenuItem<Country>(
                value: country,
                child: Text(country.name),
              );
            }).toList(),
          ),
        ),

        SizedBox(height: 20,),
        TextField(
          readOnly: true,
          controller: latController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: "Latitude",
            filled: true,
            fillColor: Colors.white, // light background
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // slight border radius
              borderSide: BorderSide(color: Colors.grey), // default border color
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
          ),
        ),
        SizedBox(height: 15),
        TextField(
          readOnly: true,
          controller: lonController,
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          decoration: InputDecoration(
            labelText: "Longitude",
            filled: true,
            fillColor: Colors.white, // light background
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8), // slight border radius
              borderSide: BorderSide(color: Colors.grey), // default border color
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey.shade400),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.grey, width: 2),
            ),
          ),
        ),

        SizedBox(height: 20),
        BlocBuilder<ConnectionStatusCubit, ConnectionStatus>(
          builder: (context, state) {
            final isConnected = state == ConnectionStatus.connected;
            return ElevatedButton(
              onPressed: isConnected
                  ? () {
                final lat = double.tryParse(latController.text);
                final lon = double.tryParse(lonController.text);
                if (lat != null && lon != null) {
                  context.read<LocationCubit>().sendLatLon(lat, lon);
                }
              }
                  : null, // Disabled when not connected
              child: Text("Send Location"),
            );
          },
        ),
      ],
    );
  }
}


class Country {
  final String name;
  final double latitude;
  final double longitude;

  Country({required this.name, required this.latitude, required this.longitude});
}

final List<Country> placeList = [
  Country(name: 'Dhaka', latitude: 23.8103, longitude: 90.4125),
  Country(name: 'Narayanganj', latitude: 23.6238, longitude: 90.5000),
  Country(name: 'Gazipur', latitude: 23.9999, longitude: 90.4203),
  Country(name: 'Savar', latitude: 23.8376, longitude: 90.3428),
  Country(name: 'Tongi', latitude: 23.8917, longitude: 90.4086),
  Country(name: 'Keraniganj', latitude: 23.6706, longitude: 90.3111),
  Country(name: 'Munshiganj', latitude: 23.5422, longitude: 90.5260),
  Country(name: 'Narsingdi', latitude: 23.9200, longitude: 90.7176),
  Country(name: 'Manikganj', latitude: 23.8617, longitude: 89.8804),
  Country(name: 'Comilla', latitude: 23.4607, longitude: 91.1809),
];

