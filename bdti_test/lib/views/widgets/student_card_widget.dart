import 'package:bdti_test/controllers/roll_call_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../models/student.dart';

class StudentCardWidget extends StatefulWidget {
  int index;
  final RollCallController controller;
  StudentCardWidget({required this.index, required this.controller, Key? key})
      : super(key: key);

  @override
  State<StudentCardWidget> createState() => _StudentCardWidgetState();
}

class _StudentCardWidgetState extends State<StudentCardWidget> {
  int? _i;
  RollCallController? _controller;

  @override
  void initState() {
    _i = widget.index;
    _controller = widget.controller;
    super.initState();
  }

  Future<void> _editDialog(BuildContext context) {
    TextEditingController _nameC =
        TextEditingController(text: _controller!.students[_i!].name);

    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Nome'),
          content: TextFormField(
            controller: _nameC,
            decoration: const InputDecoration(
              icon: Icon(Icons.person),
              hintText: 'Insira um nome',
              labelText: 'Nome',
            ),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
                _nameC.clear(); 
              },
            ),
            TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Enviar'),
                onPressed: () {
                  _controller!.edit(_nameC.text, _i!);
                  Navigator.of(context).pop();
                  _nameC.clear(); 
                }),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.085,
      child: Card(
        child: Row(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () =>
                    _controller!.delete(_controller!.students[_i!]),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Observer(builder: (_) {
                return Text(_controller!.students[_i!].name);
              }),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                  onPressed: () => _editDialog(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
