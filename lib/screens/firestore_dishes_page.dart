import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';

import '../screens/dish_detail_screen.dart';

class FirestoreDishesPage extends StatefulWidget {
  const FirestoreDishesPage({super.key});

  @override
  State<FirestoreDishesPage> createState() => _FirestoreDishesPageState();
}

class _FirestoreDishesPageState extends State<FirestoreDishesPage> {
  String selectedCountry = 'Turkey';

  final Map<String, List<String>> countryCities = {
    'Turkey': ['Istanbul', 'Ankara', 'Izmir', 'Bursa', 'Gaziantep'],
    'France': ['Paris', 'Lyon', 'Marseille', 'Nice', 'Toulouse'],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Taste Trail',
          style: GoogleFonts.montserrat(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Select Country',
                border: OutlineInputBorder(),
              ),
              value: selectedCountry,
              onChanged: (value) {
                setState(() {
                  selectedCountry = value!;
                });
              },
              items:
                  countryCities.keys.map((country) {
                    return DropdownMenuItem<String>(
                      value: country,
                      child: Text(country),
                    );
                  }).toList(),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('dishes').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData)
                  return const Center(child: CircularProgressIndicator());

                final docs = snapshot.data!.docs;
                final selectedCities = countryCities[selectedCountry] ?? [];

                final filteredDocs =
                    docs.where((doc) {
                      final city = doc['location'];
                      return selectedCities.contains(city);
                    }).toList();

                return ListView.builder(
                  itemCount: filteredDocs.length,
                  itemBuilder: (context, index) {
                    final data = filteredDocs[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      elevation: 4,
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            data['imageUrl'],
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          data['name'],
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          data['description'],
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: const Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => DishDetailScreen(
                                    name: data['name'],
                                    description: data['description'],
                                    location: data['location'],
                                    imagePath: data['imageUrl'],
                                    latitude: data['latitude'],
                                    longitude: data['longitude'],
                                  ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
