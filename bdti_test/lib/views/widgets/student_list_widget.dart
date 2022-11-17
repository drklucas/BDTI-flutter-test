import 'package:bdti_test/controllers/roll_call_controller.dart';
import 'package:bdti_test/views/widgets/student_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class StudentListWidget extends StatefulWidget {
  final RollCallController controller; 
  const StudentListWidget(this.controller, {Key? key}) : super(key: key);

  @override
  State<StudentListWidget> createState() => _StudentListWidgetState();
}

class _StudentListWidgetState extends State<StudentListWidget> {
  RollCallController? _controller;

  @override
  void initState() {
    _controller = widget.controller; 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Expanded(
      child: Observer(
        builder: (_) {
          return ListView.builder(
            itemCount: _controller!.students.length,
            itemBuilder: (context, i) {
              return StudentCardWidget(index: i, controller: _controller!); 
            }, 
            );
        }
      )
    );
  }
}
