// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, prefer_final_fields
import 'dart:math';

import 'package:flutter_application_1/enums/dogadjaji_utakmice_enum.dart';
import 'package:flutter_application_1/enums/klub_enum.dart';
import 'package:flutter_application_1/models/detalji_utakmice.dart';
import 'package:flutter_application_1/models/postave.dart';
import '../components/liga_table_widget.dart';
import '../components/navigation_button.dart';
import 'package:flutter/material.dart';

import '../models/tabele.dart';

class DetaljiUtakmice extends StatefulWidget {
  int data;
  DetaljiUtakmice({super.key, required this.data});

  @override
  State<DetaljiUtakmice> createState() => _DetaljiUtakmiceState();
}

class _DetaljiUtakmiceState extends State<DetaljiUtakmice> {
  late List<StatelessWidget> _pages = [
    DetaljiUtakmiceWidget(dogadjajiUtakmiceVM: dogadjajiUtakmiceVMs),
    PostaveWidget(postave: postave),
    StatistikaWidget(
      detalji: detalji,
    ),
    TabelaWidget()
  ];
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  late var detalji =
      DetaljiUtakmiceVM("Sarajevo", "Zeljeznicar", "2-3", dogadjajiUtakmiceVMs);
  final List<DogadjajiUtakmiceVM> dogadjajiUtakmiceVMs = [
    DogadjajiUtakmiceVM(
        "Hodzic", "12", DogadjajiUtakmiceEnum.gol, KlubEnum.domaci),
    DogadjajiUtakmiceVM(
        "Handzic", "35", DogadjajiUtakmiceEnum.gol, KlubEnum.gost),
    DogadjajiUtakmiceVM(
        "Krpic", "67", DogadjajiUtakmiceEnum.gol, KlubEnum.domaci),
    DogadjajiUtakmiceVM(
        "Cocalic", "77", DogadjajiUtakmiceEnum.zutiKarton, KlubEnum.domaci),
    DogadjajiUtakmiceVM(
        "Serbecic", "89", DogadjajiUtakmiceEnum.crveniKarton, KlubEnum.gost),
  ];

  var postave = Postave([
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
  ], [
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
    "Igrac1",
  ], "Zeljeznicar", "Sarajevo");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalji utakmice"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Row(children: [
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
                      Text(detalji.domaci, style: TextStyle(fontSize: 20))
                    ],
                  )),
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: Column(
                    children: [
                      Text(
                        detalji.rezultat,
                        style: TextStyle(fontSize: 25),
                      ),
                    ],
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
                    Text(detalji.gosti, style: TextStyle(fontSize: 20))
                  ],
                ),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NavigationButton(
                    title: 'Detalji',
                    isSelected: _selectedIndex == 0,
                    onTap: () => _onItemTapped(0),
                  ),
                  NavigationButton(
                    title: 'Postave',
                    isSelected: _selectedIndex == 1,
                    onTap: () => _onItemTapped(1),
                  ),
                  NavigationButton(
                    title: 'Statistika',
                    isSelected: _selectedIndex == 2,
                    onTap: () => _onItemTapped(2),
                  ),
                  NavigationButton(
                    title: 'Tabela',
                    isSelected: _selectedIndex == 3,
                    onTap: () => _onItemTapped(3),
                  )
                ],
              ),
            ),
            Column(
              children: [_pages[_selectedIndex]],
            )
          ],
        ),
      ),
    );
  }
}

class DetaljiUtakmiceWidget extends StatelessWidget {
  List<DogadjajiUtakmiceVM> dogadjajiUtakmiceVM;
  DetaljiUtakmiceWidget({super.key, required this.dogadjajiUtakmiceVM});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...dogadjajiUtakmiceVM
            .map((e) => DogadjajUtakmiceWidget(dogadjajiUtakmiceVM: e))
      ],
    );
  }
}

class StatistikaWidget extends StatelessWidget {
  DetaljiUtakmiceVM detalji;
  StatistikaWidget({super.key, required this.detalji});

  @override
  Widget build(BuildContext context) {
    StatistikaVM GenerisiStatistiku(DetaljiUtakmiceVM detaljiUtakmiceVM) {
      Random random = Random();
      int domaciSutevi = random.nextInt(5) + 5;
      int gostiSutevi = random.nextInt(5) + 5;
      String sutevi = "$domaciSutevi - $gostiSutevi";

      List<String> posjed = ["50%-50%", "40%-60%", "60%-40%"];
      String stvarniPosjed = posjed[random.nextInt(posjed.length)];

      int domaciFaulovi = random.nextInt(8) + 5;
      int gostiFaulovi = random.nextInt(8) + 5;
      String faulovi = "$domaciFaulovi - $gostiFaulovi";

      int domaciOfsajdi = random.nextInt(1) + 5;
      int gostiOfsajdi = random.nextInt(1) + 5;
      String ofsajdi = "$domaciOfsajdi - $gostiOfsajdi";

      return StatistikaVM(stvarniPosjed, sutevi, faulovi, ofsajdi);
    }

    StatistikaVM statistika = GenerisiStatistiku(detalji);

    return Container(
        child: Column(
      children: [
        Center(
            child: Text(
          "Posjed lopte",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        )),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(child: Text(statistika.posjed)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
              child: Text(
            "Broj šuteva",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(child: Text(statistika.sutevi)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
              child: Text(
            "Broj faulova",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(child: Text(statistika.faulovi)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Center(
              child: Text(
            "Broj ofsajda",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 6),
          child: Center(child: Text(statistika.ofsajdi)),
        )
      ],
    ));
  }
}

class PostaveWidget extends StatelessWidget {
  Postave postave;
  PostaveWidget({super.key, required this.postave});

  @override
  Widget build(BuildContext context) {
    const space = "                            ";
    return Column(
      children: [
        Text("${postave.domaciIme}$space${postave.gostiIme}"),
        for (int x = 0; x < 11; x++) ...[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text("${postave.domaci[x]}$space${postave.gosti[x]}"),
          ),
        ],
      ],
    );
  }
}

class TabelaWidget extends StatelessWidget {
  TabelaWidget({super.key});
  final List<LigaTabela> testData = [
    LigaTabela(
        column1: '1', column2: 'Zeljeznicar', column3: '12', column4: '28'),
    LigaTabela(column1: '2', column2: 'Sarajevo', column3: '12', column4: '26'),
    LigaTabela(column1: '3', column2: 'Mladost', column3: '12', column4: '25'),
    LigaTabela(
        column1: '4', column2: 'Rudar Kakanj', column3: '12', column4: '22'),
    LigaTabela(column1: '5', column2: 'Velez', column3: '12', column4: '22'),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [LIgaTableWidget(data: testData)],
      ),
    );
  }
}

class DogadjajUtakmiceWidget extends StatefulWidget {
  DogadjajiUtakmiceVM dogadjajiUtakmiceVM;
  DogadjajUtakmiceWidget({super.key, required this.dogadjajiUtakmiceVM});

  @override
  State<DogadjajUtakmiceWidget> createState() => _DogadjajUtakmiceWidgetState();
}

class _DogadjajUtakmiceWidgetState extends State<DogadjajUtakmiceWidget> {
  Icon getIcon() {
    if (widget.dogadjajiUtakmiceVM.dogadjajiUtakmiceEnum ==
        DogadjajiUtakmiceEnum.gol)
      return Icon(Icons.sports_soccer);
    else if (widget.dogadjajiUtakmiceVM.dogadjajiUtakmiceEnum ==
        DogadjajiUtakmiceEnum.zutiKarton)
      return Icon(Icons.square, color: Colors.yellow);
    return Icon(Icons.square, color: Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60, right: 60),
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment:
              widget.dogadjajiUtakmiceVM.klubEnum == KlubEnum.domaci
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.end,
          children: [
            Text(
                "${widget.dogadjajiUtakmiceVM.fudbaler} ${widget.dogadjajiUtakmiceVM.minuta}'  "),
            getIcon()
          ],
        ),
      ),
    );
  }
}
