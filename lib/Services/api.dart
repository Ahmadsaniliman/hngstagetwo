import 'dart:convert';
import 'dart:developer' as devtool show log;
import 'package:hngstagetwo/Model/country_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
//   Future<List<CountryModel>> fetchCountries() async {
//     const token = '2189|ChNAgxdQAQiobI7iJeBUAVDQ2ntMcpbY9hO8vR1H';
//     try {
//       final response = await http.get(headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $token',
//       }, Uri.parse('https://restfulcountries.com/api/v1/countries'));
//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         devtool.log(data);
//         final countries = (data['data'] as List)
//             .map((json) => CountryModel.fromJson(json))
//             .toList();
//         devtool.log('sucess!!!');
//         return countries;
//       } 

//       devtool.log('Failed!!!');
//       throw Exception('Failed to fetch countries');
//     } catch (e) {
//       devtool.log('Error fetching countries: $e');
//       throw Exception('Error fetching countries');
//     }
//   }

  Future<List<CountryModel>> fetchCountries() async {
    const token = '2189|ChNAgxdQAQiobI7iJeBUAVDQ2ntMcpbY9hO8vR1H';
    try {
      final response = await http.get(headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      }, Uri.parse('https://restfulcountries.com/api/v1/countries'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);
        final List<dynamic> countriesData = responseData['data'] as List;

        final countries = countriesData
            .map((countryJson) => CountryModel.fromJson(countryJson))
            .toList();

        devtool.log('success!!!');
        return countries;
      }

      devtool.log('Failed!!!');
      throw Exception('Failed to fetch countries');
    } catch (e) {
      devtool.log('Error fetching countries: $e');
      throw Exception('Error fetching countries: $e');
    }
  }
}

// https://restfulcountries.com/api/v1/countries

// https://restcountries.com/v3.1/all

// 2189|ChNAgxdQAQiobI7iJeBUAVDQ2ntMcpbY9hO8vR1H