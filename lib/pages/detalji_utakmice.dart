// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, curly_braces_in_flow_control_structures, prefer_final_fields
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter_application_1/enums/dogadjaji_utakmice_enum.dart';
import 'package:flutter_application_1/enums/klub_enum.dart';
import 'package:flutter_application_1/models/detalji_utakmice.dart';
import 'package:flutter_application_1/models/postave.dart';
import 'package:flutter_application_1/models/response/match_details_response.dart';
import 'package:provider/provider.dart';
import '../components/liga_table_widget.dart';
import '../components/navigation_button.dart';
import 'package:flutter/material.dart';
import '../models/tabele.dart';
import '../providers/match_provider.dart';

class DetaljiUtakmice extends StatefulWidget {
  int matchId;
  DetaljiUtakmice({super.key, required this.matchId});

  @override
  State<DetaljiUtakmice> createState() => _DetaljiUtakmiceState();
}

class _DetaljiUtakmiceState extends State<DetaljiUtakmice> {
  late List<DogadjajiUtakmiceVM> dogadjajiUtakmiceVMs = [];
  late var detalji = null;
  late List<StatefulWidget> _pages = [];
  int _selectedIndex = 0;
  MatchDetailsResponse? matchDetailsResponse;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Future<void> _fetchDetails() async {
    var matchProvider = context.read<MatchProvider>();
    var response = await matchProvider.getDetails(widget.matchId);
    setState(() {
      matchDetailsResponse = response;
      dogadjajiUtakmiceVMs = arrangeData();
      detalji = DetaljiUtakmiceVM(
        matchDetailsResponse!.gosti ?? "",
        matchDetailsResponse!.domaci ?? "",
        matchDetailsResponse!.rezultat,
        dogadjajiUtakmiceVMs,
        Uint8List.fromList(
            base64.decode(matchDetailsResponse!.domaciSlika ?? "")),
        Uint8List.fromList(
            base64.decode(matchDetailsResponse!.gostiSlika ?? "")),
      );
      _pages = [
        DetaljiUtakmiceWidget(dogadjajiUtakmiceVM: dogadjajiUtakmiceVMs),
        PostaveWidget(postave: postave),
        StatistikaWidget(
          detalji: detalji,
        ),
        TabelaWidget()
      ];
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchDetails();
  }

  List<DogadjajiUtakmiceVM> arrangeData() {
    var data = matchDetailsResponse;
    List<DogadjajiUtakmiceVM> dogadjaji = [];
    var golDetails = data!.golDetails;
    if (golDetails != null) {
      for (int i = 0; i < golDetails.length; i++) {
        dogadjaji.add(DogadjajiUtakmiceVM(
            golDetails[i].imeFudbalera ?? "",
            golDetails[i].minutaGola.toString(),
            DogadjajiUtakmiceEnum.gol,
            golDetails[i].domacin != null && golDetails[i].domacin == true
                ? KlubEnum.domaci
                : KlubEnum.gost));
      }
    }

    var zutiKartonDetails = data.zutiKartonDetails;
    if (zutiKartonDetails != null) {
      for (int i = 0; i < zutiKartonDetails.length; i++) {
        dogadjaji.add(DogadjajiUtakmiceVM(
            zutiKartonDetails[i].imeFudbalera ?? "",
            zutiKartonDetails[i].minutaKartona.toString(),
            DogadjajiUtakmiceEnum.zutiKarton,
            zutiKartonDetails[i].domacin != null &&
                    zutiKartonDetails[i].domacin == true
                ? KlubEnum.domaci
                : KlubEnum.gost));
      }
    }

    var crveniKartonDetails = data.crveniKartonDetails;
    if (crveniKartonDetails != null) {
      for (int i = 0; i < crveniKartonDetails.length; i++) {
        dogadjaji.add(DogadjajiUtakmiceVM(
            crveniKartonDetails[i].imeFudbalera ?? "",
            crveniKartonDetails[i].minutaKartona.toString(),
            DogadjajiUtakmiceEnum.crveniKarton,
            crveniKartonDetails[i].domacin != null &&
                    crveniKartonDetails[i].domacin == true
                ? KlubEnum.domaci
                : KlubEnum.gost));
      }
    }

    int compareByMinuta(DogadjajiUtakmiceVM a, DogadjajiUtakmiceVM b) {
      final minutaA = int.tryParse(a.minuta) ?? 0;
      final minutaB = int.tryParse(b.minuta) ?? 0;

      return minutaA.compareTo(minutaB);
    }

    dogadjaji.sort(compareByMinuta);

    return dogadjaji;
  }

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
              if (detalji != null)
                Flexible(
                    flex: 3,
                    fit: FlexFit.tight,
                    child: Column(
                      children: [
                        if (detalji.domaciSlika != null)
                          Image.memory(
                            detalji.domaciSlika ??
                                Uint8List.fromList([10, 20, 30]),
                            width: 150,
                            height: 150,
                          ),
                        Text(detalji.domaci ?? "",
                            style: TextStyle(fontSize: 20))
                      ],
                    )),
              if (detalji != null)
                Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: Column(
                      children: [
                        Text(
                          detalji.rezultat ?? "",
                          style: TextStyle(fontSize: 25),
                        ),
                      ],
                    )),
              if (detalji != null)
                Flexible(
                  flex: 3,
                  fit: FlexFit.tight,
                  child: Column(
                    children: [
                      if (detalji.gostiSlika != null)
                        Image.memory(
                          detalji.gostiSlika ??
                              Uint8List.fromList([10, 20, 30]),
                          width: 150,
                          height: 150,
                        ),
                      Text(detalji.gosti ?? "", style: TextStyle(fontSize: 20))
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
            if (_pages.isNotEmpty)
              Column(
                children: [_pages[_selectedIndex]],
              )
          ],
        ),
      ),
    );
  }
}

class DetaljiUtakmiceWidget extends StatefulWidget {
  List<DogadjajiUtakmiceVM> dogadjajiUtakmiceVM;
  DetaljiUtakmiceWidget({super.key, required this.dogadjajiUtakmiceVM});

  @override
  State<DetaljiUtakmiceWidget> createState() => _DetaljiUtakmiceWidgetState();
}

class _DetaljiUtakmiceWidgetState extends State<DetaljiUtakmiceWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...widget.dogadjajiUtakmiceVM
            .map((e) => DogadjajUtakmiceWidget(dogadjajiUtakmiceVM: e))
      ],
    );
  }
}

class StatistikaWidget extends StatefulWidget {
  DetaljiUtakmiceVM? detalji;
  StatistikaWidget({super.key, required this.detalji});

  @override
  State<StatistikaWidget> createState() => _StatistikaWidgetState();
}

class _StatistikaWidgetState extends State<StatistikaWidget> {
  @override
  Widget build(BuildContext context) {
    StatistikaVM GenerisiStatistiku(DetaljiUtakmiceVM? detaljiUtakmiceVM) {
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

    StatistikaVM statistika = GenerisiStatistiku(widget.detalji);

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

class PostaveWidget extends StatefulWidget {
  Postave postave;
  PostaveWidget({super.key, required this.postave});

  @override
  State<PostaveWidget> createState() => _PostaveWidgetState();
}

class _PostaveWidgetState extends State<PostaveWidget> {
  @override
  Widget build(BuildContext context) {
    const space = "                            ";
    return Column(
      children: [
        Text("${widget.postave.domaciIme}$space${widget.postave.gostiIme}"),
        for (int x = 0; x < 11; x++) ...[
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
                "${widget.postave.domaci[x]}$space${widget.postave.gosti[x]}"),
          ),
        ],
      ],
    );
  }
}

class TabelaWidget extends StatefulWidget {
  TabelaWidget({super.key});

  @override
  State<TabelaWidget> createState() => _TabelaWidgetState();
}

class _TabelaWidgetState extends State<TabelaWidget> {
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
