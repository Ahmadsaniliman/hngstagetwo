// country_listing_page.dart
import 'package:flutter/material.dart';
import 'package:hngstagetwo/Model/country_model.dart';
import 'package:hngstagetwo/Services/api.dart';
import 'package:hngstagetwo/Ui/country_details.dart';

class CountryListingPage extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const CountryListingPage({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CountryListingPageState createState() => _CountryListingPageState();
}

class _CountryListingPageState extends State<CountryListingPage> {
  List<CountryModel> countries = [];
  List<CountryModel> filteredCountries = [];
  bool isLoading = true;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void filterCountries(String query) {
    setState(() {
      filteredCountries = countries
          .where((country) =>
              country.data!.name!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  Future<void> fetchData() async {
    try {
      final fetchedCountries = await ApiService().fetchCountries();
      setState(() {
        countries = fetchedCountries;
        filteredCountries = fetchedCountries;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to load countries')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Countries',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      widget.isDarkMode ? Icons.dark_mode : Icons.light_mode,
                      color:
                          widget.isDarkMode ? Colors.white70 : Colors.black87,
                    ),
                    onPressed: widget.onThemeToggle,
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: theme.inputDecorationTheme.fillColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: searchController,
                  onChanged: filterCountries,
                  style: TextStyle(
                    color: widget.isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Search Country',
                    hintStyle: TextStyle(
                      color:
                          widget.isDarkMode ? Colors.white54 : Colors.black54,
                    ),
                    prefixIcon: Icon(
                      Icons.search,
                      color:
                          widget.isDarkMode ? Colors.white54 : Colors.black54,
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 12),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const SizedBox(height: 16),
              Expanded(
                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                        itemCount: filteredCountries.length,
                        itemBuilder: (context, index) {
                          final country = filteredCountries[index];
                          return ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                country.data!.href!.flag!,
                                width: 40,
                                height: 30,
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              country.data!.name!,
                              style: TextStyle(
                                color: widget.isDarkMode
                                    ? Colors.white70
                                    : Colors.black87,
                              ),
                            ),
                            subtitle: Text(
                              country.data!.capital!,
                              style: TextStyle(
                                color: widget.isDarkMode
                                    ? Colors.white54
                                    : Colors.black54,
                              ),
                            ),
                            onTap: () {
                              // Navigation to details page
                              Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => CountryDetailsPage(
                                    country: country,
                                    isDarkMode: widget.isDarkMode,
                                    onThemeToggle: widget.onThemeToggle,
                                  ),
                                ),
                                (route) => false,
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//  Navigator.of(context).pushNamed(
//                                 '/country-details',
//                                 arguments: {
//                                   'countryName': country.data!.name,
//                                   'countryData': country.toJson(),
//                                 },
//                               );