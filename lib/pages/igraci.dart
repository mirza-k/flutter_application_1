// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Igraci extends StatefulWidget {
  const Igraci({super.key});

  @override
  State<Igraci> createState() => _IgraciState();
}

class _IgraciState extends State<Igraci> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Igraci"))
    );
  }
}