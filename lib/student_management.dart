
class Student {
  static int _idCounter = 1;
  final int studentID;
  final String name;
  final int age;
  final String contactDetails;

  Student({
    required this.name,
    required this.age,
    required this.contactDetails,
  }) : studentID = _idCounter++;

  @override
  String toString() {
    return 'Student ID: $studentID\nName: $name\nAge: $age\nContact Details: $contactDetails';
  }
}
