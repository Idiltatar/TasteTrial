import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(
          'TasteTrail',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFE0E9),
              Color(0xFFDAF0FF),
              Color(0xFFE5FFF2),
              Color(0xFFFFF1DD),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<String>(
                  value: selectedCity,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCity = newValue!;
                    });
                  },
                  items:
                      cityDishes.keys.map<DropdownMenuItem<String>>((
                        String city,
                      ) {
                        return DropdownMenuItem<String>(
                          value: city,
                          child: Text(city, style: GoogleFonts.montserrat()),
                        );
                      }).toList(),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: cityDishes[selectedCity]!.length,
                    itemBuilder: (context, index) {
                      final dishName = cityDishes[selectedCity]![index];
                      final imagePath =
                          'assets/images/${dishName.toLowerCase()}.jpg';
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              imagePath,
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) =>
                                      const Icon(Icons.image),
                            ),
                          ),
                          title: Text(
                            dishName,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
