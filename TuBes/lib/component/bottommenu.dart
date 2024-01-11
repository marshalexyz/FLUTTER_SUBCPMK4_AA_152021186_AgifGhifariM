import 'package:flutter/material.dart';

class BottomMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
      ],
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.grey,
      currentIndex: 0, // index item terpilih
      onTap: (index) {
        // Tambahkan logika untuk menangani ketika item bottom menu dipilih
        // Misalnya, menggunakan Navigator untuk pindah halaman atau menampilkan konten terkait.
        // Contoh:
        // if (index == 0) {
        //   Navigator.pushReplacementNamed(context, '/home');
        // } else if (index == 1) {
        //   Navigator.pushReplacementNamed(context, '/search');
        // }
      },
    );
  }
}
