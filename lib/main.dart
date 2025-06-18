import 'package:flutter/material.dart';
import 'screens/TasteTrialStylePage.dart';
import 'screens/food_discovery_home.dart';

void main() {
  runApp(const TasteTrailApp());
}

class TasteTrailApp extends StatelessWidget {
  const TasteTrailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TasteTrail',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
        textTheme:
            ThemeData.dark()
                .textTheme, // Optional if you use GoogleFonts manually
      ),
      home: const TasteTrialStylePage(),
      routes: {
        '/style': (context) => const TasteTrialStylePage(),
        '/discovery': (context) => const FoodDiscoveryHomePage(),
        // You don’t need to add DishDetailScreen here since it’s pushed with MaterialPageRoute
      },
    );
  }
}
