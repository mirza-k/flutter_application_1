// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/igrac_asistent_table.dart';
import '../components/liga_table_widget.dart';
import '../components/forma_table_widget.dart';
import '../components/navigation_button.dart';


class Lige extends StatefulWidget {
  const Lige({super.key});

  @override
  State<Lige> createState() => _LigeState();
}

class _LigeState extends State<Lige> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Tabela(),
    Strijelci(),
    Asistenti(),
    Forma()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    children: [
                      Text(
                        "Izaberite ligu",
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      DropdownButtonExample()
                    ],
                  ),
                ),
                // Add your navigation items here
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      NavigationButton(
                        title: 'Tabela',
                        isSelected: _selectedIndex == 0,
                        onTap: () => _onItemTapped(0),
                      ),
                      NavigationButton(
                        title: 'Strijelci',
                        isSelected: _selectedIndex == 1,
                        onTap: () => _onItemTapped(1),
                      ),
                      NavigationButton(
                        title: 'Asistenti',
                        isSelected: _selectedIndex == 2,
                        onTap: () => _onItemTapped(2),
                      ),
                      NavigationButton(
                        title: 'Forma',
                        isSelected: _selectedIndex == 3,
                        onTap: () => _onItemTapped(3),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Column(children: [
            _pages[_selectedIndex],
          ]),
        ],
      ),
    );
  }
}

class Tabela extends StatelessWidget {
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
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: LIgaTableWidget(data: testData),
      ),
    );
  }
}

class Strijelci extends StatelessWidget {
  final List<IgracAsistentTabela> testData = [
    IgracAsistentTabela(column1: '1', column2: 'Subasic', column3: '12'),
    IgracAsistentTabela(column1: '2', column2: 'Dzeko', column3: '12'),
    IgracAsistentTabela(column1: '3', column2: 'Pjanic', column3: '12'),
    IgracAsistentTabela(column1: '4', column2: 'Misimovic', column3: '12'),
    IgracAsistentTabela(column1: '5', column2: 'Kozica', column3: '12'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IgracAsistentWidget(
          data: testData, firstLabel: "Igrac", secondLabel: "Br. golova"),
    );
  }
}

class Asistenti extends StatelessWidget {
  final List<IgracAsistentTabela> testData = [
    IgracAsistentTabela(column1: '1', column2: 'Harun', column3: '12'),
    IgracAsistentTabela(column1: '2', column2: 'Mirza', column3: '12'),
    IgracAsistentTabela(column1: '3', column2: 'Boba', column3: '12'),
    IgracAsistentTabela(column1: '4', column2: 'Bega', column3: '12'),
    IgracAsistentTabela(column1: '5', column2: 'Deki', column3: '12'),
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: IgracAsistentWidget(
          data: testData, firstLabel: "Igrac", secondLabel: "Br. asistencija"),
    );
  }
}

class Forma extends StatelessWidget {

    final List<FormaTabela> testData = [
    FormaTabela(column1: '1', column2: 'Sarajevo', column3: ['P', 'I', 'N', 'P']),
    FormaTabela(column1: '2', column2: 'Zeljo', column3: ['N', 'I', 'P', 'I']),
    FormaTabela(column1: '3', column2: 'Velez', column3: ['I', 'P', 'N', 'N'])
  ];

  @override
  Widget build(BuildContext context) {
     return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FormaTabelaWidget(
          data: testData),
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

const List<String> list = <String>['Premier Liga', 'Druga Liga'];

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.black, fontSize: 18.0),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String? value) {
        // This is called when the user selects an item.
        setState(() {
          dropdownValue = value!;
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
