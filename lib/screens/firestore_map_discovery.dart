import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FirestoreDishesWithMapPage extends StatelessWidget {
  const FirestoreDishesWithMapPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firestore Dishes with Map')),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('dishes').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong'));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final dishes =
              snapshot.data!.docs
                  .map((doc) => doc.data() as Map<String, dynamic>)
                  .toList();

          return Column(
            children: [
              // 🗺️ Map
              Expanded(
                flex: 1,
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(39.9208, 32.8541), // Ankara
                    initialZoom: 5.5,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: const ['a', 'b', 'c'],
                    ),
                    MarkerLayer(
                      markers:
                          dishes.map((dish) {
                            return Marker(
                              width: 40,
                              height: 40,
                              point: LatLng(
                                dish['latitude'] ?? 0,
                                dish['longitude'] ?? 0,
                              ),
                              child: const Icon(
                                Icons.location_on,
                                color: Colors.red,
                              ),
                            );
                          }).toList(),
                    ),
                  ],
                ),
              ),

              // 🍽️ Dish List
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: dishes.length,
                  itemBuilder: (context, index) {
                    final dish = dishes[index];
                    return ListTile(
                      title: Text(dish['name'] ?? 'No name'),
                      subtitle: Text(dish['location'] ?? 'No city'),
                      trailing: Text(dish['description'] ?? ''),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
