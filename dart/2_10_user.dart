class User {
  final String firstName;
  final String lastName;

  User({required this.firstName, required this.lastName});

  toString() {
    return 'ФИО: $firstName $lastName';
  }
}

class Student extends User {
  late DateTime yearOfAdmission;
  late int currentCourse;

  Student(User user, {required DateTime yearOfAdmission, required DateTime currentDate})
      : super(firstName: user.firstName, lastName: user.lastName) {
    this.yearOfAdmission = yearOfAdmission;
    this.currentCourse = (currentDate.year - yearOfAdmission.year) + 1;
  }

  toString() {
    return '''${super.toString()}
год поступления: ${yearOfAdmission.year}
текущий курс: ${currentCourse}
''';
  }
}

void main() {
  var student = Student(
    User(firstName: 'Айтирали', lastName: 'Кибербекович'),
    yearOfAdmission: DateTime(2020, 9, 1),
    currentDate: DateTime(2022, 12, 31),
  );
  print(student);
}
