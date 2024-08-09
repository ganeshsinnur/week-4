
import 'package:flutter/material.dart';

class Testpage extends StatefulWidget {
  const Testpage({super.key});

  @override
  State<Testpage> createState() => _Testpage();
}

class _Testpage extends State<Testpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("hello"),),
    );
  }
}
