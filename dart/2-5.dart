// void main() {
//   for (int i = 1; i <= 12; i++) {
//     print(getMonth(i));
//   }
//   printEvenNumbers(0, 100);
// }

String getMonth(int i) {
  switch (i) {
    case 1:
      return 'Январь';
    case 2:
      return 'Февраль';
    case 3:
      return 'Март';
    case 4:
      return 'Апрель';
    case 5:
      return 'Май';
    case 6:
      return 'Июнь';
    case 7:
      return 'Июль';
    case 8:
      return 'Август';
    case 9:
      return 'Сентябрь';
    case 10:
      return 'Октябрь';
    case 11:
      return 'Ноябрь';
    case 12:
      return 'Декабрь';
    default:
      return 'Unknown';
  }
}

void main() {
  printEvenNumbers(0, 100);
}

bool isEven(n) => n % 2 == 0;

void printEvenNumbers(int start, int end) {
  for (int i = start; i <= end; i++) {
    if (isEven(i)) {
      print(i);
    }
  }
}
