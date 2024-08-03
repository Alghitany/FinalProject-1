class CourseManagement {
  String? _courseCode;
  String? _title;
  String? _description;
  String? _instructor;
  String? _schedule;
  int? _maximumCapacity;
  static Map<String, CourseManagement> _courseById = {};

  CourseManagement(String courseCode, String title, String description) {
    _courseCode = courseCode;
    _title = title;
    _description = description;
  }

  void create (String courseCode, String title, String description){
    CourseManagement course = CourseManagement(courseCode, title, description);
    _courseById[_courseCode!] = course;
  }

  void update(String courseCode,String instructor, String schedule, int maxCapacity) {
    if (maxCapacity < 0) {
      throw ArgumentError('Maximum capacity cannot be negative');
    }
    _courseById[courseCode]!._maximumCapacity = maxCapacity;
    _courseById[courseCode]!._schedule = schedule;
    _courseById[courseCode]!._instructor = instructor;
  }

  String? get courseCode => _courseCode;
  String? get title => _title;
  String? get description => _description;
  String? get instructor => _instructor;
  String? get schedule => _schedule;
  int? get maximumCapacity => _maximumCapacity;
  static Map? get courseById => _courseById;
}
