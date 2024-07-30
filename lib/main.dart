
import 'dart:io';

import 'package:final_project/student_management.dart';

void main() {

  print("Enter Name , Age , Academic Year , Contact Details");
  String? name = stdin.readLineSync();
  String? age =stdin.readLineSync();
  String? academicYear = stdin.readLineSync();
  String? contactDetails = stdin.readLineSync();
  StudentManagement.registerStudent(name!, int.parse(age!), int.parse(academicYear!), contactDetails!);


}


