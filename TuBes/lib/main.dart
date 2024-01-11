import 'package:flutter/material.dart';
import 'model/earthquake.dart';
import 'services/api_service.dart';
import 'component/bottommenu.dart'; // Pastikan mengimport BottomMenu dengan benar

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ApiService apiService = ApiService();
  late Future<List<Earthquake>> futureEarthquakes;

  @override
  void initState() {
    super.initState();
    futureEarthquakes = apiService.getEarthquakes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Earthquake Data'),
      ),
      body: FutureBuilder<List<Earthquake>>(
        future: futureEarthquakes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('No earthquake data available.'),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final earthquake = snapshot.data![index];
                return ListTile(
                  title: Text(earthquake.title),
                  subtitle: Text(earthquake.location),
                  trailing: Text('Magnitude: ${earthquake.magnitude}'),
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomMenu(), // Tambahkan BottomMenu di sini
    );
  }
}
