import 'dart:math';

void main() {
  var answers = [
    solveQuadraticEquation(
      a: 8,
      c: 5,
    ),
    solveQuadraticEquation(
      a: 3,
      b: 4,
      c: 94,
    ),
    solveQuadraticEquation(
      a: -4,
      b: 28,
      c: -49,
    ),
    solveQuadraticEquation(
      a: 0.5,
      b: 0.125,
    ),
    solveQuadraticEquation(
      a: 1,
      b: -6,
      c: 8,
    ),
  ];

  for (var answer in answers) {
    print(answerQuadraticEquation(answer));
  }
}

List<double> solveQuadraticEquation({double a = 0, double b = 0, double c = 0}) {
  var D = discriminant(a, b, c);
  var ax2 = a * 2;

  List<double> roots = [];
  if (D > 0) {
    var sqrtD = sqrt(D);
    roots.add(x(ax2, b, sqrtD));
    roots.add(x(ax2, b, -sqrtD));
  } else if (D == 0) {
    roots.add(x(ax2, b, 0));
  }

  return roots;
}

String answerQuadraticEquation(List<double> roots) {
  if (roots.isEmpty) {
    return 'Уравнение не имеет решения так как его дискриминант меньше нуля';
  }
  if (roots.length == 1) {
    return 'Квадратное уравнение имеет единственное решение: x = ${roots.first}';
  }

  return 'Квадратное уравнение имеет два разных корня: x1 = ${roots.first} и x2 = ${roots.last}';
}

double discriminant(double a, double b, double c) => pow(b, 2) - 4 * a * c;

double x(double ax2, double b, double sqrtD) => (-b + sqrtD) / ax2;
