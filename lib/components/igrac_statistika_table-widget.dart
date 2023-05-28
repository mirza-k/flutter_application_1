// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../models/tabele.dart';

class IgracStatistikaTableWidget extends StatelessWidget {
  final List<FudbalerStatistikaTable> data;

  const IgracStatistikaTableWidget({Key? key, required this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
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
          ...data.map((item) {
            return TableRow(
              children: [
                TableCell(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item.column1),
                    ),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item.column2),
                    ),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item.column3),
                    ),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item.column4),
                    ),
                  ),
                ),
                TableCell(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(item.column5),
                    ),
                  ),
                ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
