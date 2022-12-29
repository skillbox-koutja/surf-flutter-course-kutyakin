import 'dart:collection';
import 'dart:io';

// 1. Создать глобальную переменную типа int с именем a
int a = 42;

// 2. Создать локальную переменную типа double с именем b

void main2() {
  int a = 2;

  print('число ${isEven(a) ? 'четное' : 'нечетное'}');

  printLoveDart();

  task8();
}

bool isEven(int n) => n % 2 == 0;

void printLoveDart() {
  // Используете 32-битный символ Unicode u2665 выведите сообщение  в консоль: I ♥ dart
  print('I \u2665 dart');
}

int desc(int a, int b) => b - a;

void task8() {
  var list = [1, 2, 3, 4, 5, 6, 7, 8];
  print('длину списка: ${list.length}');

  list.sort(desc);
  print('отсортированный список list в порядке убывания: $list');

  // выделить подсписок newList  длиной в 3 элемента
  var newList = list.take(3);
  print('подсписок newList  длиной в 3 элемента: ${newList}');

  print('индекс элемента со значением “5” в списке list: ${list.indexOf(5)}');

  list.removeWhere((element) => element >= 5);
  print('удалить значения с 5 до 8 из списка list при помощи removeWhere: $list');

  for (var i = 0; i < list.length; i++) {
    var element = list[i];
    list[i] = element <= 3 ? element * 10 : element;
  }

  print('заменить массив значениями [1,2,3] в списке list на [10, 20, 30]: $list');
}

void task9() {
  Map<String, int> numberBook = {'Иван': 2264865, 'Татьяна': 89523366684, 'Олег': 84952256575};
  print(numberBook);
  numberBook['Екатерина'] = 2359942;

  var sortedByKeyMap = new SplayTreeMap<String, int>.from(numberBook, (k1, k2) => k1.compareTo(k2));
  print(sortedByKeyMap);
}

void main() {
  task10();
}

void task10() {
  Set mySet = {'Москва', 'Вашингтон', 'Париж'};
  mySet.add('Вашингтон');
  // длина не изменится, потому что Set предназначен для хранения неупорядоченного множества уникальных элементов. Значение Вашингтон уже есть в mySet
  print(mySet.length); // 3

  var text = '''She sells sea shells on the sea shore
The shells that she sells are sea shells I am sure.
So if she sells sea shells on the sea shore
I am sure that the shells are sea shore shells''';
  var lines = text.toLowerCase().replaceAll('\.', '').split('\n');
  var words = lines.map((line) => line.trim().split(' ')).expand((line) => line);

  var uniqueWords = Set.from(words);
  print(uniqueWords.length); // 14
}
