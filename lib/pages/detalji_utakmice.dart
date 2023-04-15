// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DetaljiUtakmice extends StatefulWidget {
  int data;
  DetaljiUtakmice({super.key, required this.data});

  @override
  State<DetaljiUtakmice> createState() => _DetaljiUtakmiceState();
}

class _DetaljiUtakmiceState extends State<DetaljiUtakmice> {
  final _pages = [
    DetaljiUtakmiceWidget(),
    PostaveWidget(),
    StatistikaWidget(),
    TabelaWidget()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalji utakmice"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 75),
        child: Container(
          child: Row(children: [
            Flexible(
                flex: 3,
                fit: FlexFit.tight,
                child: Column(
                  children: [
                    Image.network(
                      "https://upload.wikimedia.org/wikipedia/en/thumb/9/9e/Zeljeznicar_logo.svg/1200px-Zeljeznicar_logo.svg.png",
                      width: 150,
                      height: 150,
                    ),
                    Text("Zeljeznicar", style: TextStyle(fontSize: 20))
                  ],
                )),
            Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 75),
                  child: Column(
                    children: [
                      Text(
                        "1 - 1",
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
                  ),
                )),
            Flexible(
              flex: 3,
              fit: FlexFit.tight,
              child: Column(
                children: [
                  Image.network(
                    "https://fksweb.fra1.digitaloceanspaces.com/6914/conversions/fc212d10f81a19dd3eca5abe6dc0aeb5-small.jpg",
                    width: 150,
                    height: 150,
                  ),
                  Text("Sarajevo", style: TextStyle(fontSize: 20))
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class DetaljiUtakmiceWidget extends StatelessWidget {
  const DetaljiUtakmiceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Detalji utakmice"),
    );
  }
}

class StatistikaWidget extends StatelessWidget {
  const StatistikaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Statistika utakmice"),
    );
  }
}

class PostaveWidget extends StatelessWidget {
  const PostaveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Statistika"),
    );
  }
}

class TabelaWidget extends StatelessWidget {
  const TabelaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Tabela"),
    );
  }
}
