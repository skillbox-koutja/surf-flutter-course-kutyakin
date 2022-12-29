import 'dart:math';

void main2() {
  var a = 'hello world';
  printReversedText(a);
}

void printReversedText(String text) {
  print(reverseText(text));
}

String reverseText(String text) => text.split(' ').reversed.join(' ');

void main() {
  var seed = 1279;
  var maxLength = 10;
  var length = generateRandomListLength(maxLength, seed);

  var maxValue = 100;
  var numbers = generateRandomNumbers(length, maxValue, seed);

  print(average(numbers));
}

double average(List<int> nums) {
  double sum = 0;
  for (var value in nums) {
    sum += value;
  }

  return sum / nums.length;
}

int generateRandomListLength(int maxLength, [int? seed]) {
  var length = Random(seed).nextInt(maxLength);

  return length > 0 ? length : maxLength;
}

List<int> generateRandomNumbers(int length, int maxValue, [int? seed]) {
  var generator = Random(seed);
  return List.generate(length, (int index) => generator.nextInt(maxValue));
}
