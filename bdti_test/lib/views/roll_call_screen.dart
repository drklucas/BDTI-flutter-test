import 'package:flutter/material.dart';

class RollCallScreen extends StatefulWidget {

  const RollCallScreen({ Key? key }) : super(key: key);

  @override
  State<RollCallScreen> createState() => _RollCallScreenState();
}

class _RollCallScreenState extends State<RollCallScreen> {

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text(''),),
           body: Container(),
       );
  }
}