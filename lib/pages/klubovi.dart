// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Klubovi extends StatefulWidget {
  const Klubovi({super.key});

  @override
  State<Klubovi> createState() => _KluboviState();
}

class _KluboviState extends State<Klubovi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Klubovi"))
    );
  }
}