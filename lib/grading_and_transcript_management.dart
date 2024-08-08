import 'package:final_project/student_management.dart';

class Assessment {
  final String type; // e.g., 'assignment', 'exam', 'quiz'
  final double score;

  Assessment({
    required this.type,
    required this.score,
  });
}

class Grade {
  final String courseCode;
  final List<Assessment> assessments = [];
  final Map<String, double> gradingCriteria;

  Grade({
    required this.courseCode,
    required this.gradingCriteria,
  });

  void addAssessment(Assessment assessment) {
    assessments.add(assessment);
  }

  double calculateFinalGrade() {
    double finalGrade = 0.0;
    for (var assessment in assessments) {
      finalGrade += assessment.score * (gradingCriteria[assessment.type] ?? 0.0);
    }
    return finalGrade;
  }

  @override
  String toString() {
    return 'Course: $courseCode, Final Grade: ${calculateFinalGrade()}';
  }
}

class Transcript {
  final Student student;
  List<Grade> grades = [];

  Transcript(this.student);

  void addGrade(Grade grade) {
    grades.add(grade);
  }

  void printTranscript() {
    print('Transcript for ${student.name}:');
    for (var grade in grades) {
      print(grade);
    }
  }
}