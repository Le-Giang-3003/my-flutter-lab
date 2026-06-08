import 'package:flutter/material.dart';

void main() {
  runApp(const CoreWidgetsApp()); // Điểm khởi chạy của app
}

class CoreWidgetsApp extends StatelessWidget {
  const CoreWidgetsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Core Widgets Demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Exercise 1 - Core Widgets')),
        // SingleChildScrollView để không bị tràn (overflow) trên màn nhỏ
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16), // Cách lề 16px cho đẹp
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Canh các widget về bên trái
            children: [
              // 1) Headline Text
              const Text(
                'Flutter UI Fundamentals',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12), // Khoảng cách dọc 12px

              // 2) Icon dùng Material Icons
              const Icon(Icons.flutter_dash, size: 48, color: Colors.blue),
              const SizedBox(height: 12),

              // 3) Image.network - tải ảnh từ Internet (cần mạng)
              Image.network(
                'https://picsum.photos/400/200', // Ảnh placeholder ngẫu nhiên
                height: 200,
                width: double.infinity, // Chiếm hết chiều ngang
                fit: BoxFit.cover,       // Cắt ảnh cho vừa khung
              ),
              const SizedBox(height: 16),

              // 4) Card chứa một ListTile
              Card(
                elevation: 4, // Độ đổ bóng
                child: const ListTile(
                  leading: Icon(Icons.movie),        // Icon bên trái
                  title: Text('Inception'),          // Dòng tiêu đề
                  subtitle: Text('Sci-Fi • 2010'),   // Dòng phụ
                  trailing: Icon(Icons.arrow_forward), // Icon bên phải
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}