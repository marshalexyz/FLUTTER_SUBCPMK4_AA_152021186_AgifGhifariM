import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/earthquake.dart';

class ApiService {
  Future<List<Earthquake>> getEarthquakes() async {
    try {
      final response = await http.get(
          Uri.parse('https://data.bmkg.go.id/DataMKG/TEWS/gempaterkini.json'));

      if (response.statusCode == 200) {
        final List<dynamic> data =
            json.decode(response.body)['Infogempa']['gempa'];
        return data
            .map((e) => Earthquake(
                title: e['Tanggal'] + ' ' + e['Jam'],
                location: e['Wilayah'],
                magnitude: double.parse(e['Magnitude'])))
            .toList();
      } else {
        // Handle non-200 status codes
        print('Error: ${response.statusCode}');
        throw Exception('Failed to load data');
      }
    } catch (e) {
      // Handle general exceptions
      print('Error: $e');
      throw Exception('Failed to load data');
    }
  }
}
