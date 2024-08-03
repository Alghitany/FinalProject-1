import 'package:final_project/student_management.dart';

import 'course_management.dart';

class Enrollment {
  Map<int, Map<String, List<Student>>> academicYearEnrollments = {};

  void enroll(Student student, Course course, int academicYear) {
    course.enrollStudent(student);
    academicYearEnrollments.putIfAbsent(academicYear, () => {}).putIfAbsent(course.courseCode, () => []).add(student);
    print('Student ${student.name} enrolled in course ${course.title} for academic year $academicYear');
  }

  void listEnrolledStudents(int academicYear, String courseCode) {
    List<Student>? students = academicYearEnrollments[academicYear]?[courseCode];
    if (students != null) {
      print('Enrolled students for course $courseCode in academic year $academicYear:');
      for (var student in students) {
        print(student);
      }
    } else {
      print('No students enrolled for course $courseCode in academic year $academicYear');
    }
  }
}