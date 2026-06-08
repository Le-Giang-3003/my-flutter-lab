import 'package:flutter/material.dart';

void main() {
  runApp(const StructureApp());
}

class StructureApp extends StatefulWidget {
  const StructureApp({super.key});

  @override
  State<StructureApp> createState() => _StructureAppState();
}

class _StructureAppState extends State<StructureApp> {
  bool _isDark = false; // false = sáng, true = tối

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Structure Demo',

      // ThemeData cho chế độ sáng và tối
      theme: ThemeData(            // Theme dùng khi sáng
        colorSchemeSeed: Colors.indigo, // Tự sinh bảng màu từ 1 màu gốc
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(        // Theme dùng khi tối
        colorSchemeSeed: Colors.indigo,
        brightness: Brightness.dark,
      ),
      // themeMode quyết định đang dùng theme nào
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,

      home: Scaffold(
        appBar: AppBar(
          title: const Text('Exercise 4 - App Structure'),
          actions: [
            // Nút bật/tắt dark mode trên AppBar
            IconButton(
              icon: Icon(_isDark ? Icons.dark_mode : Icons.light_mode),
              onPressed: () => setState(() => _isDark = !_isDark), // Đảo trạng thái
            ),
          ],
        ),
        body: const Center(
          child: Text(
            'Body content here',
            style: TextStyle(fontSize: 18),
          ),
        ),
        // FloatingActionButton (FAB)
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // SnackBar hiện thông báo ngắn ở đáy màn hình
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('FAB pressed!')),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}