import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../data/mock_dishes.dart';
import '../models/dish.dart';
import 'map_screen.dart';

class TasteTrialStylePage extends StatefulWidget {
  const TasteTrialStylePage({super.key});

  @override
  State<TasteTrialStylePage> createState() => _TasteTrialStylePageState();
}

class _TasteTrialStylePageState extends State<TasteTrialStylePage> {
  String selectedCountry = 'Turkey';
  String selectedCity = 'Istanbul';
  final Set<String> favoriteDishes = {};

  final Map<String, List<String>> countryCities = {
    'Turkey': ['Istanbul', 'Gaziantep', 'Ankara', 'Izmir', 'Bursa'],
    'France': ['Paris', 'Lyon', 'Marseille', 'Nice', 'Toulouse'],
    'Japan': ['Tokyo', 'Osaka', 'Kyoto', 'Nagoya', 'Fukuoka'],
    'Italy': ['Rome', 'Milan', 'Naples', 'Florence', 'Venice'],
    'India': ['Delhi', 'Mumbai', 'Chennai', 'Kolkata', 'Hyderabad'],
  };

  @override
  Widget build(BuildContext context) {
    final dishes = mockCityDishes[selectedCity] ?? [];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'TasteTrail',
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.bold,
            fontSize: 26,
            color: Colors.deepOrange,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              children: [
                Row(
                  children: [
                    DropdownButton<String>(
                      value: selectedCountry,
                      onChanged: (val) {
                        setState(() {
                          selectedCountry = val!;
                          selectedCity = countryCities[selectedCountry]!.first;
                        });
                      },
                      dropdownColor: Colors.white,
                      style: GoogleFonts.montserrat(color: Colors.black),
                      items:
                          countryCities.keys.map((country) {
                            return DropdownMenuItem(
                              value: country,
                              child: Text(country),
                            );
                          }).toList(),
                    ),
                    const SizedBox(width: 16),
                    DropdownButton<String>(
                      value: selectedCity,
                      onChanged: (val) {
                        setState(() {
                          selectedCity = val!;
                        });
                      },
                      dropdownColor: Colors.white,
                      style: GoogleFonts.montserrat(color: Colors.black),
                      items:
                          countryCities[selectedCountry]!.map((city) {
                            return DropdownMenuItem(
                              value: city,
                              child: Text(city),
                            );
                          }).toList(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: dishes.length,
                    itemBuilder: (context, index) {
                      final dish = dishes[index];
                      final isFav = favoriteDishes.contains(dish.name);
                      return Container(
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            ListTile(
                              contentPadding: const EdgeInsets.all(12),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  dish.imageUrl,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                  errorBuilder:
                                      (context, error, stackTrace) =>
                                          const Icon(Icons.image_not_supported),
                                ),
                              ),
                              title: Text(
                                dish.name,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.deepOrange,
                                ),
                              ),
                              subtitle: Text(dish.description),
                              trailing: IconButton(
                                icon: Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: isFav ? Colors.red : Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    isFav
                                        ? favoriteDishes.remove(dish.name)
                                        : favoriteDishes.add(dish.name);
                                  });
                                },
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                double lat = 0;
                                double lng = 0;

                                switch (selectedCity) {
                                  case 'Istanbul':
                                    lat = 41.0082;
                                    lng = 28.9784;
                                    break;
                                  case 'Gaziantep':
                                    lat = 37.0662;
                                    lng = 37.3833;
                                    break;
                                  case 'Ankara':
                                    lat = 39.9208;
                                    lng = 32.8541;
                                    break;
                                  case 'Izmir':
                                    lat = 38.4192;
                                    lng = 27.1287;
                                    break;
                                  case 'Bursa':
                                    lat = 40.1828;
                                    lng = 29.0665;
                                    break;
                                  default:
                                    lat = 0;
                                    lng = 0;
                                }

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => MapScreen(
                                          lat: lat,
                                          lng: lng,
                                          cityName: selectedCity,
                                        ),
                                  ),
                                );
                              },
                              child: const Text('Show on Map'),
                            ),
                          ],
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
