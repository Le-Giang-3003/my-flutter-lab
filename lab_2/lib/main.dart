import 'package:flutter/material.dart';

void main() {
  // exercise1();
  // exercise2();
  // exercise3();
  // exercise4();
  exercise5();
}


// void exercise1() {
//   print('--- Exercise 1: Basic Syntax & Data Types ---');
//
//   int age = 22;
//   double height = 1.70;
//   String name = 'Lê Giang';
//   bool isStudent = true;
//
//   print('Name: $name, Age: $age');
//   print('Height: $height m, Adult: ${age >= 18}');
//   print('Is student: $isStudent');
// }
//
// void exercise2() {
//   print('Exercise 2: Collections & Operators');
//   List<int> numbers = [10, 20, 30, 40];
//   print('First number: ${numbers[0]}');
//   print('Sum first two: ${numbers[0] + numbers[1]}');
//   print('Is 10 == 20? ${numbers[0] == numbers[1]}');
//   numbers.add(50);
//   numbers.remove(20);
//   print('After add/remove: $numbers');
//   Set<String> fruits = {'apple', 'banana', 'apple'};
//   print('Set (unique): $fruits');
//   Map<String, int> scores = {'Math': 9, 'English': 8};
//   print('Math score: ${scores['Math']}');
//   bool passed = scores['Math']! >= 5 && scores['English']! >= 5;
//   print(passed ? 'Result: PASS' : 'Result: FAIL');
// }
//
// String checkScore(int score) {
//   if (score >= 8) {
//     return 'Excellent';
//   } else if (score >= 5) {
//     return 'Pass';
//   } else {
//     return 'Fail';
//   }
// }
// int square(int x) => x * x;
// void exercise3() {
//   print('--- Exercise 3: Control Flow & Functions ---');
//   print('Score 9 => ${checkScore(9)}');
//   int day = 3;
//   switch (day) {
//     case 1:
//       print('Monday');
//       break;
//     case 3:
//       print('Wednesday');
//       break;
//     default:
//       print('Other day');
//   }
//   List<int> nums = [1, 2, 3];
//   for (int i = 0; i < nums.length; i++) {
//     print('for: ${nums[i]}');
//   }
//   for (var n in nums) {
//     print('for-in: $n');
//   }
//   nums.forEach((n) => print('forEach square: ${square(n)}'));
// }

// // Lớp cha
// class Car {
//   String brand; // thuộc tính
//
//   // Constructor thường: this.brand là cú pháp rút gọn gán thẳng vào field
//   Car(this.brand);
//
//   // Named constructor: tạo object theo cách đặt tên riêng (C# không có cái này)
//   Car.unknown() : brand = 'Unknown';
//
//   // Phương thức
//   void drive() {
//     print('$brand is driving with fuel.');
//   }
// }
//
// // Lớp con kế thừa Car
// class ElectricCar extends Car {
//   ElectricCar(String brand) : super(brand); // gọi constructor lớp cha
//
//   @override // ghi đè method drive() của lớp cha
//   void drive() {
//     print('$brand is driving with electricity.');
//   }
// }
//
// void exercise4() {
//   print('--- Exercise 4: Intro to OOP ---');
//
//   Car car1 = Car('Toyota');
//   car1.drive();              // dùng method gốc
//
//   Car car2 = Car.unknown();  // dùng named constructor
//   car2.drive();
//
//   ElectricCar tesla = ElectricCar('Tesla');
//   tesla.drive();             // dùng method đã override
// }

// Hàm async trả về Future (giống async Task<string> trong C#)
Future<String> loadData() async {
  // Future.delayed: giả lập chờ 1 giây (như Task.Delay)
  await Future.delayed(Duration(seconds: 1));
  return 'Data loaded';
}

// Stream phát ra lần lượt các số (giống IAsyncEnumerable / yield return)
Stream<int> countStream() async* {
  for (int i = 1; i <= 3; i++) {
    await Future.delayed(Duration(milliseconds: 500));
    yield i; // phát ra giá trị i
  }
}

// async để dùng được await bên trong
Future<void> exercise5() async {
  print('--- Exercise 5: Async, Future, Null Safety & Streams ---');

  // await: chờ Future chạy xong rồi lấy kết quả
  String result = await loadData();
  print(result);

  // Null safety
  String? nickname;                       // ? = biến có thể null
  print('Nickname: ${nickname ?? "N/A"}'); // ?? = nếu null thì lấy giá trị bên phải

  nickname = 'GiangDev';
  print('Length: ${nickname!.length}');   // ! = khẳng định "chắc chắn không null"

  // Lắng nghe Stream: chờ từng giá trị được phát ra
  await for (var value in countStream()) {
    print('Stream value: $value');
  }
}