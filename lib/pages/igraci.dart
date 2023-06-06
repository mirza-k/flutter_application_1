// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/igrac_statistika_table-widget.dart';

import '../components/dropdown_button_widget.dart';
import '../models/tabele.dart';

class HistorijaFudbalera extends StatelessWidget {
  int fudbalerId;
  HistorijaFudbalera({super.key, required this.fudbalerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Historija fudbalera"),
      ),
      body: Column(
        children: [Text("Historija fudbalera")],
      ),
    );
  }
}

class Igraci extends StatefulWidget {
  const Igraci({super.key});

  @override
  State<Igraci> createState() => _IgraciState();
}

class _IgraciState extends State<Igraci> {
  @override
  List<String> listaLiga = <String>['Premier Liga', 'Druga Liga'];
  List<String> listaFudbalera = <String>['Fudbaler1', 'Fudbaler2'];
  List<FudbalerStatistikaTable> testData = [
    FudbalerStatistikaTable(
        column1: 'Zeljo 3-2 Sarajevo',
        column2: '1',
        column3: '0',
        column4: '0',
        column5: '0'),
    FudbalerStatistikaTable(
        column1: 'Zeljo 3-2 Sarajevo',
        column2: '1',
        column3: '0',
        column4: '0',
        column5: '0'),
    FudbalerStatistikaTable(
        column1: 'Zeljo 3-2 Sarajevo',
        column2: '0',
        column3: '1',
        column4: '0',
        column5: '0'),
    FudbalerStatistikaTable(
        column1: 'Zeljo 3-2 Sarajevo',
        column2: '0',
        column3: '0',
        column4: '0',
        column5: '0'),
    FudbalerStatistikaTable(
        column1: 'Zeljo 3-2 Sarajevo',
        column2: '2',
        column3: '1',
        column4: '0',
        column5: '0'),
    FudbalerStatistikaTable(
        column1: 'Zeljo 3-2 Sarajevo',
        column2: '1',
        column3: '1',
        column4: '0',
        column5: '0'),
    FudbalerStatistikaTable(
        column1: 'Zeljo 3-2 Sarajevo',
        column2: '0',
        column3: '0',
        column4: '0',
        column5: '0'),
    FudbalerStatistikaTable(
        column1: 'Zeljo 3-2 Sarajevo',
        column2: '0',
        column3: '0',
        column4: '0',
        column5: '0'),
    FudbalerStatistikaTable(
        column1: 'Zeljo 3-2 Sarajevo',
        column2: '0',
        column3: '0',
        column4: '0',
        column5: '0'),
    FudbalerStatistikaTable(
        column1: 'Zeljo 3-2 Sarajevo',
        column2: '0',
        column3: '0',
        column4: '0',
        column5: '0')
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    Text(
                      "Izaberite ligu",
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    DropdownButtonExample(list: listaLiga),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      "Izaberite fudbalera",
                      style: TextStyle(
                          fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    DropdownButtonExample(list: listaFudbalera)
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Row(
              children: [
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Sedad Subasic"),
                        Text("Klub: Zeljeznicar"),
                        Text("Godina: 37"),
                        Text("Visina: 182"),
                        Text("Tezina: 85"),
                        Text("Jača noga: Lijeva"),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                                '/historija-fudbalera',
                                arguments: 123);
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              "Historija fudbalera",
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Column(
                    children: [
                      Image.network(
                        "https://img.a.transfermarkt.technology/portrait/big/549488-1645971350.jpg?lm=1",
                        width: 150,
                        height: 150,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 20)),
        IgracStatistikaTableWidget(data: testData)
      ]),
    ));
  }
}
