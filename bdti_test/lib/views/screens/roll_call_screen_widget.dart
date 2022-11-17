import 'package:bdti_test/controllers/roll_call_controller.dart';
import 'package:bdti_test/views/widgets/student_list_widget.dart';
import 'package:flutter/material.dart';

class RollCallScreenWidget extends StatefulWidget {
  const RollCallScreenWidget({Key? key}) : super(key: key);

  @override
  State<RollCallScreenWidget> createState() => _RollCallScreenWidgetState();
}

class _RollCallScreenWidgetState extends State<RollCallScreenWidget> {
  final RollCallController _controller = RollCallController();
  final TextEditingController _nameC = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _addDialog(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Incluir Nome'),
          content: Form(
            key: _formKey,
            child: TextFormField(
              controller: _nameC,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Insira um nome',
                labelText: 'Nome',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Insira um nome!';
                }
                return null;
              },
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
                  if (_formKey.currentState!.validate()) {
                    _controller.add(_nameC.text);
                    Navigator.of(context).pop();
                    _nameC.clear();
                  }
                }),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de presença'),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _addDialog(context),
          icon: const Icon(Icons.person_add),
          label: const Text(
            'Adicionar Nome',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.green.shade800),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: StudentListWidget(_controller),
      ),
    );
  }
}
