import 'dart:developer';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SudokuPage(),
    );
  }
}

class SudokuPage extends StatefulWidget {
  @override
  _SudokuPageState createState() => _SudokuPageState();
}

class _SudokuPageState extends State<SudokuPage> {
  List<List<int>> sudoku = [
    [5, 3, 0, 0, 7, 0, 0, 0, 0],
    [6, 0, 0, 1, 9, 5, 0, 0, 0],
    [0, 9, 8, 0, 0, 0, 0, 6, 0],
    [8, 0, 0, 0, 6, 0, 0, 0, 3],
    [4, 0, 0, 8, 0, 3, 0, 0, 1],
    [7, 0, 0, 0, 2, 0, 0, 0, 6],
    [0, 6, 0, 0, 0, 0, 2, 8, 0],
    [0, 0, 0, 4, 1, 9, 0, 0, 5],
    [0, 0, 0, 0, 8, 0, 0, 7, 9]
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sudoku'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.count(
                crossAxisCount: 9,
                children: List.generate(81, (index) {
                  int row = index ~/ 9;
                  int col = index % 9;
                  return Container(
                    padding: EdgeInsets.all(2.0),
                    child: Text(
                      sudoku[row][col] == 0 ? '' : sudoku[row][col].toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.black),
                    ),
                  );
                }),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  var position = [4, 5];
                  List<int> horizontalLine = [];
                  List<int> verticalLine = [];
                  for (var i = 0; i < sudoku.length; i++) {
                    // log(sudoku[i].toString());
                    if (i == position[0]) {
                      horizontalLine.addAll(sudoku[i]);
                    }
                    // if (i == position[1]) {
                    // log("Validacion linea vertical");
                    verticalLine.add(sudoku[i][position[1]]);
                    // }
                  }
                  log("Linea horizontal");
                  log(horizontalLine.toString());
                  log("Linea Vertical");
                  log(verticalLine.toString());
                  // for (var i = 0; i < sudoku.length; i++) {
                  //   log(sudoku[i].toString());
                  //   log(sudoku[i].toString());
                  // }
                },
                child: const Text(
                  "Solve",
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
