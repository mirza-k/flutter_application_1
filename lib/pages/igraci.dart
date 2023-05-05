// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/igrac_statistika_table-widget.dart';

import '../components/dropdown_button_widget.dart';
import '../models/tabele.dart';

class Igraci extends StatefulWidget {
  const Igraci({super.key});

  @override
  State<Igraci> createState() => _IgraciState();
}

class _IgraciState extends State<Igraci> {
  @override
  List<String> listaLiga = <String>['Premier Liga', 'Druga Liga'];
  List<String> listaFudbalera = <String>['Fudbaler1', 'Fudbaler2'];
  List<LigaTabela> testData = [
    LigaTabela(
        column1: '1', column2: 'Zeljeznicar', column3: '12', column4: '28'),
    LigaTabela(column1: '2', column2: 'Sarajevo', column3: '12', column4: '26'),
    LigaTabela(column1: '3', column2: 'Mladost', column3: '12', column4: '25'),
    LigaTabela(
        column1: '4', column2: 'Rudar Kakanj', column3: '12', column4: '22'),
    LigaTabela(column1: '5', column2: 'Velez', column3: '12', column4: '22'),
    LigaTabela(column1: '5', column2: 'Velez', column3: '12', column4: '22'),
    LigaTabela(column1: '5', column2: 'Velez', column3: '12', column4: '22'),
    LigaTabela(column1: '5', column2: 'Velez', column3: '12', column4: '22'),
    LigaTabela(column1: '5', column2: 'Velez', column3: '12', column4: '22'),
    LigaTabela(column1: '5', column2: 'Velez', column3: '12', column4: '22')
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
                      style:
                          TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                    ),
                    DropdownButtonExample(list: listaLiga),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      "Izaberite fudbalera",
                      style:
                          TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
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
                        Text("Jača noga: Lijeva")
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
