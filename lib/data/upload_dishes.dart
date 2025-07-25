import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import '../firebase_options.dart';

Future<void> uploadDishes() async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final CollectionReference dishes = FirebaseFirestore.instance.collection(
    'dishes',
  );

  final sampleDishes = [
    {
      "name": "Menemen",
      "description": "Eggs with tomato and pepper",
      "location": "Istanbul",
      "imageUrl": "assets/images/menemen.jpg",
      "latitude": 41.0082,
      "longitude": 28.9784,
    },
    {
      "name": "Baklava",
      "description": "Sweet pastry with pistachios",
      "location": "Gaziantep",
      "imageUrl": "assets/images/baklava.jpg",
      "latitude": 37.0662,
      "longitude": 37.3833,
    },
    {
      "name": "Baguette",
      "description": "Crispy French bread",
      "location": "Paris",
      "imageUrl": "assets/images/baguette.jpg",
      "latitude": 48.8566,
      "longitude": 2.3522,
    },
    {
      "name": "Bouillabaisse",
      "description": "Traditional fish stew",
      "location": "Marseille",
      "imageUrl": "assets/images/bouillabaisse.jpg",
      "latitude": 43.2965,
      "longitude": 5.3698,
    },
  ];

  for (var dish in sampleDishes) {
    await dishes.add(dish);
  }

  print("✅ Sample dishes uploaded successfully!");
}
