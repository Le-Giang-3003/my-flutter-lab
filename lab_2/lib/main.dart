import 'package:flutter/material.dart';

void main() {
  exercise1();
  exercise2();
  exercise3();
}


void exercise1() {
  print('--- Exercise 1: Basic Syntax & Data Types ---');

  int age = 22;
  double height = 1.70;
  String name = 'Lê Giang';
  bool isStudent = true;

  print('Name: $name, Age: $age');
  print('Height: $height m, Adult: ${age >= 18}');
  print('Is student: $isStudent');
}

void exercise2() {
  print('Exercise 2: Collections & Operators');
  List<int> numbers = [10, 20, 30, 40];
  print('First number: ${numbers[0]}');
  print('Sum first two: ${numbers[0] + numbers[1]}');
  print('Is 10 == 20? ${numbers[0] == numbers[1]}');
  numbers.add(50);
  numbers.remove(20);
  print('After add/remove: $numbers');
  Set<String> fruits = {'apple', 'banana', 'apple'};
  print('Set (unique): $fruits');
  Map<String, int> scores = {'Math': 9, 'English': 8};
  print('Math score: ${scores['Math']}');
  bool passed = scores['Math']! >= 5 && scores['English']! >= 5;
  print(passed ? 'Result: PASS' : 'Result: FAIL');
}

String checkScore(int score) {
  if (score >= 8) {
    return 'Excellent';
  } else if (score >= 5) {
    return 'Pass';
  } else {
    return 'Fail';
  }
}
int square(int x) => x * x;
void exercise3() {
  print('--- Exercise 3: Control Flow & Functions ---');
  print('Score 9 => ${checkScore(9)}');
  int day = 3;
  switch (day) {
    case 1:
      print('Monday');
      break;
    case 3:
      print('Wednesday');
      break;
    default:
      print('Other day');
  }
  List<int> nums = [1, 2, 3];
  for (int i = 0; i < nums.length; i++) {
    print('for: ${nums[i]}');
  }
  for (var n in nums) {
    print('for-in: $n');
  }
  nums.forEach((n) => print('forEach square: ${square(n)}'));
}