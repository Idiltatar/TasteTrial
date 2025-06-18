import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatelessWidget {
  final double lat;
  final double lng;
  final String cityName;

  const MapScreen({
    super.key,
    required this.lat,
    required this.lng,
    required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$cityName on Map'),
        backgroundColor: Colors.deepOrange,
      ),
      body: FlutterMap(
        options: MapOptions(center: LatLng(lat, lng), zoom: 13.0),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.tastetrail',
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(lat, lng),
                width: 60,
                height: 60,
                child: const Icon(
                  Icons.location_on,
                  size: 40,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
