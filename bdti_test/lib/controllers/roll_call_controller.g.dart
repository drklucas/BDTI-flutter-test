// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roll_call_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RollCallController on _RollCallController, Store {
  late final _$studentsAtom =
      Atom(name: '_RollCallController.students', context: context);

  @override
  List<Student> get students {
    _$studentsAtom.reportRead();
    return super.students;
  }

  @override
  set students(List<Student> value) {
    _$studentsAtom.reportWrite(value, super.students, () {
      super.students = value;
    });
  }

  late final _$_RollCallControllerActionController =
      ActionController(name: '_RollCallController', context: context);

  @override
  dynamic get() {
    final _$actionInfo = _$_RollCallControllerActionController.startAction(
        name: '_RollCallController.get');
    try {
      return super.get();
    } finally {
      _$_RollCallControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic add(String name) {
    final _$actionInfo = _$_RollCallControllerActionController.startAction(
        name: '_RollCallController.add');
    try {
      return super.add(name);
    } finally {
      _$_RollCallControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic edit(String name, int i) {
    final _$actionInfo = _$_RollCallControllerActionController.startAction(
        name: '_RollCallController.edit');
    try {
      return super.edit(name, i);
    } finally {
      _$_RollCallControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic delete(Student student) {
    final _$actionInfo = _$_RollCallControllerActionController.startAction(
        name: '_RollCallController.delete');
    try {
      return super.delete(student);
    } finally {
      _$_RollCallControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
students: ${students}
    ''';
  }
}
