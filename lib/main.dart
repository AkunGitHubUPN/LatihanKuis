import 'package:flutter/material.dart';
import 'vehicle-data.dart';
import 'detail.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo Home Page'),
          backgroundColor: Colors.blue,
        ),

        body: GridView.count(
          crossAxisCount: 2, 
          padding: const EdgeInsets.all(50),
          mainAxisSpacing: 20, // Jarak antar baris
          crossAxisSpacing: 25, // Jarak antar kolom

          children: vehicleList.map((vehicle) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context)  {
                      // Kirim data 'vehicle' ke halaman DetailScreen
                      return DetailScreen(vehicle: vehicle);
                    }
                  )
                );
              },
              child: Card(
                elevation: 4, 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                clipBehavior: Clip.antiAlias, // agar gambar sesuai dengan border radius
              
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch, // agar gambar memenuhi lebar card
                  children: [
                    
                    Expanded( // agar gambar memenuhi ruang yang tersedia
                      child: Image.network(
                        vehicle.imageUrls[0], // Menggunakan URL pertama
                        fit: BoxFit.cover,
                        // Tampilan saat gambar sedang dimuat
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const Center(child: CircularProgressIndicator());
                        },
                        // Tampilan jika gambar gagal dimuat
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image, size: 50, color: Colors.grey);
                        },
                      ),
                    ),
              
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        vehicle.name, 
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
              
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        vehicle.price, 
                        style: const TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
              
                    const SizedBox(height: 8.0),
              
                  ],
                ),
              ),
            );
          }).toList(), // Mengonversi hasil map ke dalam list
        ),
      ),
    );
  }
}