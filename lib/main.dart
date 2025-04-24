import 'package:flutter/material.dart';

void main() {
  runApp(const FoodDiscoveryApp());
}

class FoodDiscoveryApp extends StatelessWidget {
  const FoodDiscoveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Discovery',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
      ),
      home: const FoodDiscoveryHomePage(),
    );
  }
}

class FoodDiscoveryHomePage extends StatefulWidget {
  const FoodDiscoveryHomePage({super.key});

  @override
  State<FoodDiscoveryHomePage> createState() => _FoodDiscoveryHomePageState();
}

class _FoodDiscoveryHomePageState extends State<FoodDiscoveryHomePage> {
  String selectedCity = 'Istanbul';

  final Map<String, List<String>> cityDishes = {
    'Istanbul': ['Kebab', 'Baklava', 'Lahmacun'],
    'Paris': ['Croissant', 'Baguette', 'Ratatouille'],
    'Tokyo': ['Sushi', 'Ramen', 'Tempura'],
    'New York': ['Pizza', 'Bagel', 'Cheesecake'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Discovery'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Select a City:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: selectedCity,
              onChanged: (newValue) {
                setState(() {
                  selectedCity = newValue!;
                });
              },
              items:
                  cityDishes.keys.map<DropdownMenuItem<String>>((String city) {
                    return DropdownMenuItem<String>(
                      value: city,
                      child: Text(city),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 20),
            Text(
              'Popular Dishes in $selectedCity:',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cityDishes[selectedCity]!.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      title: Text(cityDishes[selectedCity]![index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
