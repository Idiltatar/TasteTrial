import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../firebase_options.dart';
import 'mock_dishes.dart';

Future<void> uploadMockDishes() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final CollectionReference dishesCollection = FirebaseFirestore.instance
      .collection('dishes');

  // Clear existing data (optional)
  final snapshots = await dishesCollection.get();
  for (var doc in snapshots.docs) {
    await doc.reference.delete();
  }

  // Upload all dishes
  mockCityDishes.forEach((city, dishList) {
    for (var dish in dishList) {
      dishesCollection.add({
        'name': dish.name,
        'description': dish.description,
        'location': dish.location,
        'imageUrl': dish.imageUrl,
        'latitude': dish.latitude,
        'longitude': dish.longitude,
      });
    }
  });

  print('Mock dishes uploaded!');
}
