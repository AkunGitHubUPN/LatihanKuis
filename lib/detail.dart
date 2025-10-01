import 'package:flutter/material.dart';
import 'vehicle-data.dart';

class DetailScreen extends StatelessWidget {
  // Properti ini akan menampung data mobil yang dikirim dari halaman utama
  final Vehicle vehicle;

  // Constructor yang mewajibkan pengiriman data 'vehicle'
  const DetailScreen({super.key, required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Judul AppBar diambil dari nama mobil
        title: Text(vehicle.name),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar utama
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(vehicle.imageUrls[0]),
              ),
              const SizedBox(height: 16.0),

              // Harga
              Text(
                vehicle.price,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 8.0),

              // Tipe
              Text(
                'Tipe: ${vehicle.type}',
                style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
              ),
              const SizedBox(height: 16.0),

              // Deskripsi
              const Text(
                'Deskripsi:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(
                vehicle.description,
                style: const TextStyle(fontSize: 16),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 16.0),

              // Spesifikasi
              const Text(
                'Spesifikasi:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text('Mesin: ${vehicle.engine}', style: const TextStyle(fontSize: 16)),
              Text('Bahan Bakar: ${vehicle.fuelType}', style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}