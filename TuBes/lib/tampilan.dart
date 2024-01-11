import 'package:flutter/material.dart';
import 'model/earthquake.dart';
import 'component/bottommenu.dart';

class EarthquakeListView extends StatelessWidget {
  final List<Earthquake> earthquakes;

  EarthquakeListView({required this.earthquakes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Earthquake List'),
      ),
      body: ListView.builder(
        itemCount: earthquakes.length,
        itemBuilder: (context, index) {
          final earthquake = earthquakes[index];
          return ListTile(
            title: Text(earthquake.title),
            subtitle: Text(earthquake.location),
            trailing: Text('Magnitude: ${earthquake.magnitude}'),
          );
        },
      ),
      bottomNavigationBar: BottomMenu(), // Panggil BottomMenu di sini
    );
  }
}
