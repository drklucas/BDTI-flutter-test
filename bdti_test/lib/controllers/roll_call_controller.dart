import 'package:bdti_test/data/dummyData.dart';
import 'package:bdti_test/models/student.dart';
import 'package:mobx/mobx.dart';

part 'roll_call_controller.g.dart';

class RollCallController = _RollCallController with _$RollCallController;

abstract class _RollCallController with Store {
  @observable
  List<Student> students = ObservableList.of([]);

  @action
  get() {
    final data = dummyStudents; 
    for(var dt in data) {
      students.add(
        Student.fromMap(dt)
      ); 
    }
  }

  @action
  add(String name) {
    students.add(Student.fromMap({'name': name}));
  }

  @action
  edit(String name, int i) {
    students[i] = Student.fromMap({'name': name});
  }

  @action
  delete(Student student) {
    students.remove(student);
  }
}
