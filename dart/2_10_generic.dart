class Converter {
  String convertToString<T>(T value) {
    return value.toString();
  }
}

class Bike {}

void main() {
  final converter = Converter();
  print(converter.convertToString(42));
  print(converter.convertToString(3.14));
  print(converter.convertToString([1, 2, 3, 5, 8]));
  print(converter.convertToString(Bike()));
}
