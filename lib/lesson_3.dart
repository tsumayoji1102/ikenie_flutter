void main() {
  final students = [
    Student(
      num: 1,
      name: "田中",
      testPoint: 60,
      role: ClassRoles.organizer,
    ),
    Student(
      num: 2,
      name: "山本",
      testPoint: 70,
      role: ClassRoles.books,
    ),
    Student(
      num: 3,
      name: "佐藤",
      testPoint: 80,
      isMan: false,
      role: ClassRoles.cleaner,
    ),
    Student(
      num: 4,
      name: "鈴木",
      testPoint: 40,
      isMan: false,
      role: ClassRoles.cleaner,
    ),
    Student(
      num: 5,
      name: "本田",
      testPoint: 30,
    ), // 学級委員に属していない
  ];
  printStudentInfo(students);
  printClassInfo(students);
  waitFiveSecond();
}

// 問題1
class Student {
  final int num;
  final String name;
  final int testPoint;
  final bool isMan;
  final ClassRoles? role;

  Student({
    required this.num,
    required this.name,
    required this.testPoint,
    this.isMan = true,
    this.role,
  });
}

void printStudentInfo(List<Student> students) {
  print(students.map((student) => student.name).toList());
  print(students
      .where((student) => student.testPoint >= 50)
      .map((student) => student.name)
      .toList());
  print(students
      .where((student) => student.testPoint >= 50 && !student.isMan)
      .map((student) => student.name)
      .toList());
}

// 問題3
enum ClassRoles {
  organizer,
  books,
  cleaner;

  String get japaneseName {
    switch (this) {
      case ClassRoles.organizer:
        return "学級委員";
      case ClassRoles.books:
        return "図書委員";
      case ClassRoles.cleaner:
        return "風紀委員";
    }
  }
}

// 問題4
void printClassInfo(List<Student> students) {
  // 委員会の出力
  print(ClassRoles.values.map((role) => role.japaneseName).toList());

  // 学級委員のメンバー一覧
  print(students
      .where((student) => student.role == ClassRoles.organizer)
      .map((student) => student.name)
      .toList());
  // 委員に属していないメンバー一覧
  print(students
      .where((student) => student.role == null)
      .map((student) => student.name)
      .toList());
}

// 問題5
Future<void> waitFiveSecond() async {
  print("開始 ${DateTime.now()}");
  await Future.delayed(Duration(seconds: 5));
  print("終了 ${DateTime.now()}");
}
