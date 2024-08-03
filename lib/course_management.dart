import 'package:final_project/student_management.dart';

class Course {
  final String courseCode;
  final String title;
  final String description;
  final String instructor;
  final String schedule;
  final int maxCapacity;
  List<Student> enrolledStudents = [];

  Course({
    required this.courseCode,
    required this.title,
    required this.description,
    required this.instructor,
    required this.schedule,
    required this.maxCapacity,
  });

  bool enrollStudent(Student student) {
    if (enrolledStudents.length < maxCapacity) {
      enrolledStudents.add(student);
      return true;
    }
    return false;
  }

  @override
  String toString() {
    return 'Course Code: $courseCode\nTitle: $title\nDescription: $description\nInstructor: $instructor\nSchedule: $schedule\nMax Capacity: $maxCapacity\nEnrolled Students: ${enrolledStudents.length}';
  }
}
