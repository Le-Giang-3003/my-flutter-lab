import 'package:flutter/material.dart';

void main() {
  runApp(const DebugApp());
}

class DebugApp extends StatefulWidget {
  const DebugApp({super.key});

  @override
  State<DebugApp> createState() => _DebugAppState();
}

class _DebugAppState extends State<DebugApp> {
  int _count = 0; // Biến đếm để minh họa setState

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Exercise 5 - Debug & Fix')),
        // FIX lỗi 2: SingleChildScrollView chống overflow
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text('Count: $_count', style: const TextStyle(fontSize: 20)),

              // FIX lỗi 3: setState để UI cập nhật
              ElevatedButton(
                onPressed: () => setState(() => _count++),
                child: const Text('Increase'),
              ),

              const SizedBox(height: 16),

              ElevatedButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,                 // context này nằm dưới MaterialApp nên hợp lệ
                    initialDate: DateTime.now(),      // Ngày hiển thị mặc định
                    firstDate: DateTime(2000),        // Giới hạn nhỏ nhất
                    lastDate: DateTime(2100),         // Giới hạn lớn nhất
                  );
                  if (date != null) {                 // Chỉ xử lý khi người dùng thật sự chọn
                    // ignore: avoid_print
                    print('Picked: $date');           // In ra console cho gọn (không cần hiện lên UI)
                  }
                },
                child: const Text('Open DatePicker'),
              ),
              // FIX lỗi 1: ListView trong Column.
              // Vì đang ở trong SingleChildScrollView nên ListView phải
              // tắt cuộn riêng và để nó tự co theo nội dung:
              ListView.builder(
                shrinkWrap: true,                         // Co lại vừa nội dung
                physics: const NeverScrollableScrollPhysics(), // Không cuộn riêng
                itemCount: 5,
                itemBuilder: (context, i) => ListTile(
                  leading: const Icon(Icons.check),
                  title: Text('Item ${i + 1}'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}