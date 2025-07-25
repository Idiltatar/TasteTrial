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
    final mapController = MapController();
    print('🗺️ Map opened for $cityName at LAT: $lat — LNG: $lng');

    const double initialZoom = 6.0;

    return Scaffold(
      appBar: AppBar(
        title: Text('$cityName on Map'),
        backgroundColor: Colors.deepOrange,
      ),
      body: FlutterMap(
        mapController: mapController,
        options: MapOptions(
          initialCenter: LatLng(lat, lng),
          initialZoom: initialZoom,
        ),
        children: [
          TileLayer(
            urlTemplate:
                'https://{s}.tile.openstreetmap.fr/hot/{z}/{x}/{y}.png',
            subdomains: const ['a', 'b', 'c'],
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
