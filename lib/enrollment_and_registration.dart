import 'package:final_project/student_management.dart';

import 'course_management.dart';

class Enrollment {
  Map<int, Map<String, List<Student>>> academicYearEnrollments = {};
  Map<int, Map<int, List<String>>> studentCompletedCourses = {};

  void enroll(Student student, Course course, int academicYear) {
    List<String> completedCourses = studentCompletedCourses[student.studentID]?.values.expand((e) => e).toList() ?? [];
    if (course.enrollStudent(student, completedCourses)) {
      academicYearEnrollments.putIfAbsent(academicYear, () => {}).putIfAbsent(course.courseCode, () => []).add(student);
      print('Student ${student.name} enrolled in course ${course.title} for academic year $academicYear');
    } else {
      print('Student ${student.name} does not meet prerequisites or the course is at full capacity');
    }
  }

  void completeCourse(Student student, String courseCode, int academicYear) {
    studentCompletedCourses.putIfAbsent(student.studentID, () => {}).putIfAbsent(academicYear, () => []).add(courseCode);
    print('Student ${student.name} completed course $courseCode in academic year $academicYear');
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