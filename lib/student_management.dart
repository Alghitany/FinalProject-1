

class StudentManagement{

  static int _studentId = 0;
  int? _id;
  String _name;
  int _age;
  int _academicYear;
  String _contactDetails;

  static Map<int, List<StudentManagement>> _studentsByYear = {};

  StudentManagement(this._name, this._age, this._academicYear, this._contactDetails){
    _id = _studentId;
  }

  static void registerStudent(String name,int age,int academicYear, String contactDetails){
    // Register Data
    _studentId++;
    StudentManagement student = StudentManagement(name, age, academicYear, contactDetails);

    if (!_studentsByYear.containsKey(academicYear)) {
      _studentsByYear[academicYear] = [];
    }
    _studentsByYear[academicYear]!.add(student);
    print("Student Added Successfully to Year $academicYear");

  }

  /*
  static void printStudents() {
    for (int year in _studentsByYear.keys) {
      print("Year $year:");
      for (StudentManagement student in _studentsByYear[year]!) {
        print("  ${student._name} (${student._id})");
      }
    }
  }*/
}