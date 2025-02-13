import 'package:flutter/material.dart';
import 'package:hngstagetwo/Model/country_model.dart';
import 'package:hngstagetwo/Ui/home.dart';

class CountryDetailsPage extends StatelessWidget {
  final CountryModel country;
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const CountryDetailsPage({
    super.key,
    required this.country,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
                builder: (_) => CountryListingPage(
                      isDarkMode: isDarkMode,
                      onThemeToggle: onThemeToggle,
                    )),
            (route) => false,
          ),
        ),
        title: Text(country.data!.name!),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.network(
                      country.data!.href!.flag!,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildInfoRow('Capital:', country.data!.capital ?? 'N/A'),
                  _buildInfoRow('Region:', country.data!.continent!),
                  _buildInfoRow('Country code:', country.data!.phoneCode!),
                  _buildInfoRow('Currency:', country.data!.currency!),
                  _buildInfoRow('Independence:',
                      country.data!.independenceDate.toString()),
                  _buildInfoRow(
                      'Population:', country.data!.population.toString()),
                  _buildInfoRow('Area:', '${country.data!.size} km2'),
                  _buildInfoRow(
                      'Description', country.data!.description.toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 140,
            child: Text(
              label,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black87,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
