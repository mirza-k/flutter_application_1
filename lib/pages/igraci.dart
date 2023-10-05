// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/response/fudbaler_detail_response.dart';
import 'package:flutter_application_1/models/response/fudbaler_response.dart';
import 'package:flutter_application_1/providers/fudbaler_provider.dart';
import 'package:provider/provider.dart';
import '../models/response/klub_response.dart';
import '../models/tabele.dart';
import '../providers/klub_provider.dart';

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
  KlubResponse? klubValue;
  List<KlubResponse> klubResults = [];
  FudbalerResponse? fudbalerValue;
  List<FudbalerResponse> fudbalerResult = [];
  FudbalerDetailResponse? fudbalerDetailResult;
  Future<void> _fetchKlubovi() async {
    var _klubProvider = context.read<KlubProvider>();
    var result = await _klubProvider.getAll();
    setState(() {
      klubResults = result.result;
    });
  }

  Future<void> _fetchFudbaleri() async {
    fudbalerValue = null;
    fudbalerDetailResult = null;
    if (klubValue != null) {
      var klubId = klubValue!.klubId;
      if (klubId != null && klubId != 0) {
        var _fudbalerProvider = context.read<FudbalerProvider>();
        var response = await _fudbalerProvider.get(klubId);
        setState(() {
          fudbalerResult = response.result;
        });
      }
    }
  }

  Future<void> _fetchFudbalerUtakmiceDetails() async {
    if (fudbalerValue != null) {
      var fudbalerId = fudbalerValue!.fudbalerId;
      if (fudbalerId != null && fudbalerId != 0) {
        var _fudbalerProvider = context.read<FudbalerProvider>();
        var response = await _fudbalerProvider.getDetails(fudbalerId);
        setState(() {
          fudbalerDetailResult = response;
        });
      }
    }
  }

  List<String> listaLiga = <String>['Premier Liga', 'Druga Liga'];
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

  @override
  void initState() {
    super.initState();
    _fetchKlubovi();
  }

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
                      "Odaberi klub",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButton<KlubResponse>(
                        isExpanded: true,
                        value: klubValue,
                        onChanged: (val) {
                          setState(() => klubValue = val!);
                          _fetchFudbaleri();
                        },
                        items: klubResults
                            .map((val) => DropdownMenuItem(
                                value: val, child: Text(val.naziv ?? "")))
                            .toList(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey,
                          size: 24,
                        ),
                        underline: SizedBox(),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 20)),
                    Text(
                      "Odaberi fudbalera",
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.grey,
                          width: 2,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: DropdownButton<FudbalerResponse>(
                        isExpanded: true,
                        value: fudbalerValue,
                        onChanged: (val) {
                          setState(() => fudbalerValue = val!);
                          _fetchFudbalerUtakmiceDetails();
                        },
                        items: fudbalerResult
                            .map((val) => DropdownMenuItem(
                                value: val,
                                child: Text('${val.ime} ${val.prezime}')))
                            .toList(),
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        icon: const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.grey,
                          size: 24,
                        ),
                        underline: SizedBox(),
                      ),
                    ),
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
                if (fudbalerValue != null)
                  Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Ime prezime: ${fudbalerValue!.ime} ${fudbalerValue!.prezime}'),
                          Text('Klub ${fudbalerValue!.klub}'),
                          Text('Godine: ${fudbalerValue!.brojGodina}'),
                          Text('Visina ${fudbalerValue!.visina}'),
                          Text('Tezina ${fudbalerValue!.tezina}'),
                          Text('Jaca noga: ${fudbalerValue!.jacaNoga}'),
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  '/historija-fudbalera',
                                  arguments: 123);
                            },
                            child: Text(
                              "Historija fudbalera",
                              style: TextStyle(
                                color: Colors.blue,
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
                    children: [],
                  ),
                )
              ],
            ),
          ),
        ),
        Padding(padding: const EdgeInsets.only(top: 20)),
        if (fudbalerDetailResult != null)
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Table(
              border: TableBorder.all(),
              columnWidths: const {
                0: FlexColumnWidth(4),
                1: FlexColumnWidth(1),
                2: FlexColumnWidth(1),
                3: FlexColumnWidth(1),
                4: FlexColumnWidth(1)
              },
              children: [
                TableRow(
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                  children: [
                    TableCell(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Utakmica',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'G',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'A',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 13,
                              height: 20,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5),
                              ),
                            )),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 13,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                ...fudbalerDetailResult!.utakmice.map((item) {
                  return TableRow(
                    children: [
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(item.rezultat),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(item.golovi.toString()),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(0.toString()),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(item.zutiKartoni.toString()),
                          ),
                        ),
                      ),
                      TableCell(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(item.crveniKartoni.toString()),
                          ),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ],
            ),
          )
      ]),
    ));
  }
}
