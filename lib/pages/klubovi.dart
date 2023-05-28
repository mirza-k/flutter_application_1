// ignore_for_file: prefer_const_constructors, unnecessary_new, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/klubovi.dart';

import '../components/dropdown_button_widget.dart';
import '../components/navigation_button.dart';

class Klubovi extends StatefulWidget {
  const Klubovi({super.key});

  @override
  State<Klubovi> createState() => _KluboviState();
}

class _KluboviState extends State<Klubovi> {
  List<String> listaKlubova = ["Klub 1", "Klub 2", "Klub 3"];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [TrenutnaSezona(), HistorijaSezona()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              children: [
                Text(
                  "Izaberite klub",
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                DropdownButtonExample(list: listaKlubova),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NavigationButton(
                        title: 'Trenutna sezona',
                        isSelected: _selectedIndex == 0,
                        onTap: () => _onItemTapped(0),
                      ),
                      NavigationButton(
                        title: 'Historija',
                        isSelected: _selectedIndex == 1,
                        onTap: () => _onItemTapped(1),
                      ),
                    ],
                  ),
                ),
                Column(children: [
                  _pages[_selectedIndex],
                ]),
              ],
            ),
          ),
        )
      ]),
    ));
  }
}

class TrenutnaSezona extends StatelessWidget {
  TrenutnaSezona({super.key});
  TrenutnaSezonaVM data = new TrenutnaSezonaVM(33, 23, [
    "Klub1 3-3 Klub2",
    "Klub3 4-4 Klub4",
    "Klub1 3-3 Klub2",
    "Klub3 4-4 Klub4",
    "Klub1 3-3 Klub2",
    "Klub3 4-4 Klub4",
    "Klub1 3-3 Klub2",
    "Klub3 4-4 Klub4",
    "Klub1 3-3 Klub2",
    "Klub3 4-4 Klub4",
  ]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        child: Column(children: [
          Text(
            'Broj datih golova: ${data.brojGolova}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            'Broj primljenih golova: ${data.brojPrimljenihGolova}',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                ...data.KlubUtakmice.map((item) {
                  return Center(
                    child: Column(
                      children: [
                        Text(
                          "${item}",
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  );
                })
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class HistorijaSezona extends StatefulWidget {
  HistorijaSezona({super.key});

  @override
  State<HistorijaSezona> createState() => _HistorijaSezonaState();
}

class _HistorijaSezonaState extends State<HistorijaSezona> {
  @override

  List<String> ListaSezona = [
    "2022/2023",
    "2021/2022",
    "2020/2021"
  ];
TrenutnaSezonaVM data = new TrenutnaSezonaVM(44, 23, [
    "Klub1 0-0 Klub2",
    "Klub3 1-1 Klub4",
    "Klub1 0-3 Klub2",
    "Klub3 0-0 Klub4",
    "Klub1 0-1 Klub2",
    "Klub3 0-2 Klub4",
    "Klub1 3-4 Klub2",
    "Klub3 0-7 Klub4",
    "Klub1 0-6 Klub2",
    "Klub3 4-4 Klub4"
  ]);

  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        Text(
          "Izaberite sezonu",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        DropdownButtonExample(list: ListaSezona),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(children: [
            Text(
              'Broj datih golova: ${data.brojGolova}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Broj primljenih golova: ${data.brojPrimljenihGolova}',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  ...data.KlubUtakmice.map((item) {
                    return Center(
                      child: Column(
                        children: [
                          Text(
                            "${item}",
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    );
                  })
                ],
              ),
            )
          ]),
        ),
      ]),
    );
  }
}
