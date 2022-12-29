import 'dart:async';
import 'dart:io';
import 'dart:convert';

void main() {
  late StreamSubscription<String> subscription;

  subscription = readLine().listen((String line) {
    if (line == 'exit') {
      subscription.cancel();
      return;
    }

    processLine(line);
  });
}

Stream<String> readLine() => stdin.transform(utf8.decoder).transform(const LineSplitter());

void processLine(String line) {
  print('Введена строка $line');
}
