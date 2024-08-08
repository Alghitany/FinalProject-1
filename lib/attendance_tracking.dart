


import 'package:final_project/student_management.dart';

class Attendance {
  Map<String, Map<int, List<String>>> courseAttendance = {};

  void recordAttendance(String courseCode, Student student, String date) {
    courseAttendance.putIfAbsent(courseCode, () => {}).putIfAbsent(student.studentID, () => []).add(date);
    print('Recorded attendance for ${student.name} on $date for course $courseCode');
  }

  void printAttendance(String courseCode, Student student) {
    print('Attendance for ${student.name} in course $courseCode: ${courseAttendance[courseCode]?[student.studentID]}');
  }
}