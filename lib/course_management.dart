import 'package:final_project/student_management.dart';

class Course {
  final String courseCode;
  final String title;
  final String description;
  final String instructor;
  final String schedule;
  final int maxCapacity;
  List<Student> enrolledStudents = [];
  List<String> prerequisites;
  Map<String, double> gradingCriteria; // e.g., {'assignment': 0.4, 'exam': 0.6}

  Course({
    required this.courseCode,
    required this.title,
    required this.description,
    required this.instructor,
    required this.schedule,
    required this.maxCapacity,
    this.prerequisites = const [],
    required this.gradingCriteria,
  });

  bool enrollStudent(Student student, List<String> completedCourses) {
    if (enrolledStudents.length < maxCapacity && _prerequisitesMet(completedCourses)) {
      enrolledStudents.add(student);
      return true;
    }
    return false;
  }

  bool _prerequisitesMet(List<String> completedCourses) {
    for (var prereq in prerequisites) {
      if (!completedCourses.contains(prereq)) {
        return false;
      }
    }
    return true;
  }

  @override
  String toString() {
    return 'Course Code: $courseCode\nTitle: $title\nDescription: $description\nInstructor: $instructor\nSchedule: $schedule\nMax Capacity: $maxCapacity\nEnrolled Students: ${enrolledStudents.length}\nPrerequisites: ${prerequisites.join(', ')}\nGrading Criteria: ${gradingCriteria.toString()}';
  }
}