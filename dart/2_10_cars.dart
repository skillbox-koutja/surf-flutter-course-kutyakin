enum Colors {
  red,
  green,
  blue,
}

abstract class Paintable {
  late Colors _color;

  void paint(Colors color) {
    _color = color;
  }

  Colors get color => _color;
}

abstract class WithEngine {
  late int enginePower;
}

abstract class Car with Paintable, WithEngine {
  late double weight;

  Car(Colors color) {
    paint(color);
  }

  String runEngine() {
    return 'Двигатель работает. Максимальная скорость = ${enginePower / weight}';
  }

  void run();
}

class Truck extends Car {
  Truck(super.color);

  @override
  double get weight => 10;

  @override
  int get enginePower => 2000;

  @override
  void run() {
    print(runEngine());
  }

  toString() {
    return 'Цвет грузовика: ${color.name}';
  }
}

class Sportcar extends Car {
  Sportcar(super.color);

  @override
  double get weight => 2;

  @override
  int get enginePower => 600;

  @override
  void run() {
    print(runEngine());
  }

  toString() {
    return 'Цвет спортивного автомобиля: ${color.name}';
  }
}

class Bike with Paintable {
  Bike(Colors color) {
    paint(color);
  }

  toString() {
    return 'Цвет велосипеда: ${color.name}';
  }
}

void main() {
  var sportcar = Sportcar(Colors.red);
  print(sportcar);
  sportcar.run();

  var truck = Truck(Colors.blue);
  print(truck);
  truck.run();

  var bike = Bike(Colors.green);
  print(bike);
}
