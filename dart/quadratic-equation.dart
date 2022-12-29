import 'dart:io';

void main() {
  var sum = 0.0;
  while (true) {
    print('Введите число, или "stop", чтобы узнать результат:');
    var line = stdin.readLineSync();

    if (shouldStop(line)) {
      break;
    }

    var input = Input(line);
    if (input.valid) {
      sum += input.value;
    } else {
      print('Вы ввели некорректное число!');
    }
  }

  print(sum);
}

bool shouldStop(String? input) => input == 'stop';

class Input {
  bool _valid = false;
  double? _value;

  Input(String? input) {
    if (input != null) {
      _value = double.tryParse(input);
      _valid = _value != null;
    }
  }

  bool get valid => _valid;
  double get value => _value!;
}
