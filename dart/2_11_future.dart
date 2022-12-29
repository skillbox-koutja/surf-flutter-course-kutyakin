import 'dart:async';
import 'dart:io';

void main() async {
  stdout.write('Введите сообщения: ');

  final str = await readLine();

  print('Введена строка $str');
}

Future<String?> readLine() {
  return Future(() {
    return stdin.readLineSync();
  });
}
