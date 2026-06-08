import 'package:flutter/material.dart';

void main() {
  runApp(const InputApp());
}

class InputApp extends StatelessWidget {
  const InputApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: InputControlsDemo());
  }
}

class InputControlsDemo extends StatefulWidget {
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() => _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo> {
  double _volume = 50;            // Giá trị Slider (0 - 100)
  bool _isDark = false;           // Trạng thái Switch
  String _gender = 'Male';        // Lựa chọn của nhóm Radio
  DateTime? _pickedDate;          // Ngày được chọn (có thể null lúc đầu)

  // Hàm mở hộp thoại chọn ngày
  Future<void> _showDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),       // Ngày hiển thị mặc định
      firstDate: DateTime(2000),         // Giới hạn ngày nhỏ nhất
      lastDate: DateTime(2100),          // Giới hạn ngày lớn nhất
    );
    // Chỉ cập nhật nếu người dùng thật sự chọn (không bấm Cancel)
    if (date != null) {
      setState(() => _pickedDate = date); // setState để UI vẽ lại
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exercise 2 - Input Widgets')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // --- Slider ---
          Text('Volume: ${_volume.round()}'), // round() để bỏ phần thập phân
          Slider(
            value: _volume,
            min: 0,
            max: 100,
            onChanged: (newValue) {
              setState(() => _volume = newValue); // Cập nhật khi kéo
            },
          ),

          // --- Switch ---
          SwitchListTile(
            title: const Text('Dark mode'),
            value: _isDark,
            onChanged: (val) => setState(() => _isDark = val),
          ),

          const Divider(), // Đường kẻ ngăn cách

          // --- Nhóm RadioListTile ---
          const Text('Gender:'),
          RadioListTile<String>(
            title: const Text('Male'),
            value: 'Male',          // Giá trị của lựa chọn này
            groupValue: _gender,    // Lựa chọn đang được chọn của cả nhóm
            onChanged: (val) => setState(() => _gender = val!),
          ),
          RadioListTile<String>(
            title: const Text('Female'),
            value: 'Female',
            groupValue: _gender,
            onChanged: (val) => setState(() => _gender = val!),
          ),

          const Divider(),

          // --- DatePicker ---
          ElevatedButton(
            onPressed: _showDatePicker, // Bấm để mở lịch
            child: const Text('Pick a date'),
          ),
          const SizedBox(height: 8),
          // Nếu chưa chọn thì hiện 'No date', ngược lại hiện ngày đã chọn
          Text(_pickedDate == null
              ? 'No date selected'
              : 'Selected: ${_pickedDate!.day}/${_pickedDate!.month}/${_pickedDate!.year}'),
        ],
      ),
    );
  }
}