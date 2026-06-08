import 'dart:async';

Future<void> main() async {
  // await exercise1();
  // await exercise2();
  // exercise3();
  // await Future.delayed(Duration.zero);
  // await exercise4();
  exercise5();
}

/*
class Product {
  final int id;
  final String name;
  final double price;
  Product(this.id, this.name, this.price);
  @override
  String toString() => 'Product($id, $name, \$$price)';
}
class ProductRepository {
  final _controller = StreamController<Product>.broadcast();
  Future<List<Product>> getAll() async {
    await Future.delayed(const Duration(seconds: 1));
    return [Product(1, 'Bàn phím', 25.0), Product(2, 'Chuột', 15.0),];}
  Stream<Product> liveAdded() => _controller.stream;
  void add(Product p) => _controller.add(p);
  void dispose() => _controller.close();
}
Future<void> exercise1() async {
  print('--- Exercise 1 ---');
  final repo = ProductRepository();
  repo.liveAdded().listen((p) => print('Mới thêm: $p'));
  final all = await repo.getAll();
  print('Danh sách ban đầu: $all');
  repo.add(Product(3, 'Tai nghe', 40.0));
  repo.add(Product(4, 'Webcam', 30.0));
  await Future.delayed(Duration.zero);
  repo.dispose();}

class User {
  final String name;
  final String email;
  User(this.name, this.email);
  factory User.fromJson(Map<String, dynamic> json) {
    return User(json['name'] as String, json['email'] as String);}
  @override
  String toString() => 'User($name, $email)';
}
class UserRepository {
  Future<List<User>> fetchUsers() async {
    await Future.delayed(const Duration(milliseconds: 500)); // giả lập mạng
    final List<Map<String, dynamic>> jsonData = [
      {'name': 'An', 'email': 'an@mail.com'},
      {'name': 'Bình', 'email': 'binh@mail.com'},
    ];
    return jsonData.map((item) => User.fromJson(item)).toList();
  }
}

Future<void> exercise2() async {
  print('--- Exercise 2 ---');
  final users = await UserRepository().fetchUsers();
  for (final u in users) {
    print(u);
  }
}
  */

// void exercise3() {
//   print('--- Exercise 3 ---');
//
//   print('1. Bắt đầu (đồng bộ)');
//
//   Future(() => print('4. Future (event queue)'));
//
//   scheduleMicrotask(() => print('3. Microtask'));
//
//   print('2. Kết thúc (đồng bộ)');
// }

// Future<void> exercise4() async {
//   print('--- Exercise 4 ---');
//
//   // Tạo stream các số 1..5
//   final numbers = Stream.fromIterable([1, 2, 3, 4, 5]);
//
//   final result = numbers
//       .map((n) => n * n)        // biến mỗi số thành bình phương: 1,4,9,16,25
//       .where((sq) => sq.isEven); // chỉ giữ số chẵn: 4, 16
//
//   // await for: lặp qua từng giá trị stream phát ra
//   await for (final value in result) {
//     print('Giá trị: $value');
//   }
// }

class Settings {
  String theme;

  // Constructor private (dấu _ trước tên): không cho tạo từ bên ngoài
  Settings._internal(this.theme);

  // Biến static giữ instance duy nhất (cache)
  static final Settings _instance = Settings._internal('light');

  // factory: luôn trả về CÙNG MỘT instance đã cache
  factory Settings() => _instance;
}

void exercise5() {
  print('--- Exercise 5 ---');

  final a = Settings();
  final b = Settings();

  a.theme = 'dark'; // thay đổi trên a...

  print('b.theme = ${b.theme}'); // ...b cũng đổi vì a và b là CÙNG object
  print('identical(a, b) = ${identical(a, b)}'); // true → cùng 1 object
}