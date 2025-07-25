import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DishMapPage extends StatelessWidget {
  final Map<String, dynamic> dish;
  const DishMapPage({super.key, required this.dish});

  @override
  Widget build(BuildContext context) {
    final lat = dish['latitude']?.toDouble() ?? 0.0;
    final lng = dish['longitude']?.toDouble() ?? 0.0;

    return Scaffold(
      appBar: AppBar(title: Text(dish['name'] ?? 'Dish Location')),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(lat, lng), // ✅ use initialCenter (not center)
          initialZoom: 13, // ✅ use initialZoom (not zoom)
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'com.example.touristapp',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80,
                height: 80,
                point: LatLng(lat, lng),
                child: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
