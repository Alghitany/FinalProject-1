
import 'package:final_project/student_management.dart';
import 'package:final_project/user_roles_and_access_control.dart';

import 'attendance_tracking.dart';
import 'course_management.dart';
import 'enrollment_and_registration.dart';
import 'grading_and_transcript_management.dart';

void main() {
  // Create instances of management systems
  Enrollment enrollmentSystem = Enrollment();
  Attendance attendanceSystem = Attendance();
  UserManagement userManagement = UserManagement();

  // Register users
  userManagement.addUser(User(username: 'admin', password: 'admin123', role: UserRole.administrator));
  userManagement.addUser(User(username: 'teacher1', password: 'teach123', role: UserRole.teacher));
  userManagement.addUser(User(username: 'student1', password: 'stud123', role: UserRole.student));

  // Authenticate as administrator
  User? admin = userManagement.authenticate('admin', 'admin123');
  if (admin != null && userManagement.hasPermission(admin, 'manage_courses')) {
    print('Administrator logged in and has permission to manage courses');

    // Create students
    Student student1 = Student(name: 'Alice', age: 20, contactDetails: 'alice@example.com');
    Student student2 = Student(name: 'Bob', age: 22, contactDetails: 'bob@example.com');

    // Create courses
    Course course1 = Course(
      courseCode: 'CS101',
      title: 'Introduction to Computer Science',
      description: 'Basic concepts of computer science',
      instructor: 'John Doe',
      schedule: 'Mon-Wed-Fri 10:00-11:00',
      maxCapacity: 30,
      gradingCriteria: {'assignment': 0.4, 'exam': 0.6},
    );

    // Enroll students (admin action)
    int academicYear = 2024;
    if (userManagement.hasPermission(admin, 'enroll_courses')) {
      enrollmentSystem.enroll(student1, course1, academicYear);
    }

    // Authenticate as teacher
    User? teacher = userManagement.authenticate('teacher1', 'teach123');
    if (teacher != null && userManagement.hasPermission(teacher, 'record_attendance')) {
      print('Teacher logged in and has permission to record attendance');

      // Record attendance (teacher action)
      attendanceSystem.recordAttendance(course1.courseCode, student1, '2024-07-01');
    }

    // Authenticate as student
    User? student = userManagement.authenticate('student1', 'stud123');
    if (student != null && userManagement.hasPermission(student, 'view_transcript')) {
      print('Student logged in and has permission to view transcript');

      // View transcript (student action)
      Transcript transcript1 = Transcript(student1);
      transcript1.addGrade(Grade(courseCode: course1.courseCode, gradingCriteria: course1.gradingCriteria));
      transcript1.printTranscript();
    }
  } else {
    print('Authentication failed or insufficient permissions');
  }
}

