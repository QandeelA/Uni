import 'package:excel/excel.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const int rows = 10000;
  void exportToExcel() {
    final excel = Excel.createExcel();
    final Sheet sheet = excel.getDefaultSheet() as Sheet;
    for (var row = 0; row < rows; row++) {
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: row))
          .value = 'FLUTTER';
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: row))
          .value = 'is';
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: row))
          .value = "Google's";
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: row))
          .value = "UI";
      sheet
          .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: row))
          .value = "toolkit";
    }

     excel.Save(fileName: "MyData.xlsx");
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              '$rows rows to Excel',
              style: TextStyle(fontSize: 40),
            ),
          ),
          Center(
            child: ElevatedButton(
              child: Text('Export to Excel'),
              onPressed: exportToExcel,
            ),
          ),
        ],
      ),
    );
  }
}