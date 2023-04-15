// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/detalji_utakmice.dart';

class Utakmice extends StatefulWidget {
  const Utakmice({super.key});

  @override
  State<Utakmice> createState() => _UtakmiceState();
}

class Utakmica {
  final String Domacin;
  final String Gost;
  final String Rezultat;

  const Utakmica({
    required this.Domacin,
    required this.Gost,
    required this.Rezultat,
  });
}

class _UtakmiceState extends State<Utakmice> {
  // int _selectedIndex = 0;
  int? koloValue = 0;
  List<Utakmica> utakmice = [
    Utakmica(Domacin: "Sarajevo", Gost: "Zeljo", Rezultat: "2-2"),
    Utakmica(Domacin: "Sarajevo", Gost: "Zeljo", Rezultat: "2-2"),
    Utakmica(Domacin: "Sarajevo", Gost: "Zeljo", Rezultat: "2-2"),
    Utakmica(Domacin: "Sarajevo", Gost: "Zeljo", Rezultat: "2-2"),
    Utakmica(Domacin: "Sarajevo", Gost: "Zeljo", Rezultat: "2-2")
  ];

  // late final List<Widget> _pages = [
  //   PreviewUtakmice(utakmice: utakmice)
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Column(
                children: [
                  Text(
                    "Odaberi kolo: $koloValue",
                    style:
                        TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                  ),
                  DropdownButtonExample(
                    onChanged: (int? value) {
                      setState(() {
                        koloValue = value;
                      });
                    },
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0),
                        child: Container(
                          width: double.infinity,
                          color: Colors.blue,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                "Premier Liga",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                      PreviewUtakmice(utakmice: utakmice)
                      // DetaljiUtakmice()
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}

class PreviewUtakmice extends StatelessWidget {
  List<Utakmica> utakmice;
  PreviewUtakmice({super.key, required this.utakmice});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        ...utakmice.map((item) {
          return Center(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${item.Domacin}  ${item.Rezultat}  ${item.Gost}", style: TextStyle(fontSize: 18),),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed('/detalji-utakmice', arguments: 123);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("detalji", style: TextStyle(color: Colors.blue,),)
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        })
      ]),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  final Function(int?)? onChanged;
  DropdownButtonExample({super.key, required this.onChanged});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

const List<int> list = <int>[1, 2, 3, 4, 5];

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  int dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black, fontSize: 18.0),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (value) {
        setState(() {
          dropdownValue = value!;
          widget.onChanged!(value);
        });
      },
      items: list.map<DropdownMenuItem<int>>((int value) {
        return DropdownMenuItem<int>(
          value: value,
          child: Text(value.toString()),
        );
      }).toList(),
    );
  }
}
