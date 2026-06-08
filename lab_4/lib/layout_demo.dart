import 'package:flutter/material.dart';

void main() {
  runApp(const LayoutApp());
}

class LayoutApp extends StatelessWidget {
  const LayoutApp({super.key});

  // Dữ liệu mẫu để đổ vào ListView
  final List<String> movies = const [
    'Inception',
    'The Matrix',
    'Interstellar',
    'Tenet',
    'Dunkirk',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Exercise 3 - Layout Basics')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Section 1: Tiêu đề có Padding ---
            const Padding(
              padding: EdgeInsets.all(16), // Padding bao quanh đều 16px
              child: Text(
                'Now Showing',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),

            // --- Section 2: Một Row gồm 2 nút ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16), // Chỉ padding trái/phải
              child: Row(
                children: [
                  Icon(Icons.local_movies, color: Colors.deepPurple),
                  SizedBox(width: 8), // Khoảng cách ngang giữa icon và text
                  Text('Filter by genre'),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // --- Section 3: ListView.builder ---
            // QUAN TRỌNG: ListView trong Column phải bọc Expanded,
            // nếu không sẽ lỗi "unbounded height" (Exercise 5 sẽ nói rõ).
            Expanded(
              child: ListView.builder(
                itemCount: movies.length, // Số phần tử
                itemBuilder: (context, index) {
                  // Hàm này được gọi cho từng item, index từ 0 -> length-1
                  return ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')), // Số thứ tự
                    title: Text(movies[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}