// User Roles and Access Control
enum UserRole { administrator, teacher, student }

class User {
  final String username;
  final String password;
  final UserRole role;

  User({
    required this.username,
    required this.password,
    required this.role,
  });
}

class UserManagement {
  Map<String, User> _users = {};

  void addUser(User user) {
    _users[user.username] = user;
  }

  User? authenticate(String username, String password) {
    User? user = _users[username];
    if (user != null && user.password == password) {
      return user;
    }
    return null;
  }

  bool hasPermission(User user, String action) {
    switch (user.role) {
      case UserRole.administrator:
      // Administrators can do everything
        return true;
      case UserRole.teacher:
      // Teachers can only manage courses, attendance, and grades
        return action == 'manage_courses' || action == 'record_attendance' || action == 'grade_students';
      case UserRole.student:
      // Students can only view courses, enroll in courses, and view transcripts
        return action == 'view_courses' || action == 'enroll_courses' || action == 'view_transcript';
      default:
        return false;
    }
  }
}
