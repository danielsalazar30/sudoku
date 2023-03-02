import 'dart:developer';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sudoku',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SudokuPage(),
    );
  }
}

class SudokuPage extends StatefulWidget {
  const SudokuPage({super.key});

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
        title: const Text('Sudoku'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: GridView.count(
                crossAxisCount: 9,
                children: List.generate(81, (index) {
                  int row = index ~/ 9;
                  int col = index % 9;
                  return Container(
                    padding: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.0, color: Colors.black),
                    ),
                    child: Text(
                      sudoku[row][col] == 0 ? '' : sudoku[row][col].toString(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  );
                }),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  var position = [6, 2];
                  var squareNumber = 0;
                  var squareChosen = [];
                  // Identify the position where the number is gonna be
                  // Identify first 3 squares
                  if (position[0] >= 0 && position[0] <= 2) {
                    if (position[1] >= 0 && position[1] <= 2) {
                      squareNumber = 1;
                    }
                    if (position[1] >= 3 && position[1] <= 5) {
                      squareNumber = 4;
                    }
                    if (position[1] >= 6 && position[1] <= 8) {
                      squareNumber = 7;
                    }
                  }
                  // Identify 3 to 6 squares
                  if (position[0] >= 3 && position[0] <= 5) {
                    if (position[1] >= 0 && position[1] <= 2) {
                      squareNumber = 2;
                    }
                    if (position[1] >= 3 && position[1] <= 5) {
                      squareNumber = 5;
                    }
                    if (position[1] >= 6 && position[1] <= 8) {
                      squareNumber = 8;
                    }
                  }
                  // Identify 6 to 9 squares
                  if (position[0] >= 6 && position[0] <= 8) {
                    if (position[1] >= 0 && position[1] <= 2) {
                      squareNumber = 3;
                    }
                    if (position[1] >= 3 && position[1] <= 5) {
                      squareNumber = 7;
                    }
                    if (position[1] >= 6 && position[1] <= 8) {
                      squareNumber = 9;
                    }
                  }
                  log("squareNumber");
                  log(squareNumber.toString());
                  List<int> horizontalLine = [];
                  List<int> verticalLine = [];
                  for (var i = 0; i < sudoku.length; i++) {
                    // Horizontal line
                    if (i == position[0]) {
                      horizontalLine.addAll(sudoku[i]);
                    }
                    // Vertical line
                    verticalLine.add(sudoku[i][position[1]]);
                    // Square chosen
                    if (i >= 0 && i <= 2) {
                      if (squareNumber == 1) {
                        for (var d = 0; d <= 2; d++) {
                          squareChosen.add(sudoku[i][d]);
                        }
                      }
                      if (squareNumber == 2) {
                        for (var d = 3; d <= 5; d++) {
                          squareChosen.add(sudoku[i][d]);
                        }
                      }
                      if (squareNumber == 3) {
                        for (var d = 6; d <= 8; d++) {
                          squareChosen.add(sudoku[i][d]);
                        }
                      }
                    }
                    if (i >= 3 && i <= 5) {
                      if (squareNumber == 4) {
                        for (var d = 0; d <= 2; d++) {
                          squareChosen.add(sudoku[i][d]);
                        }
                      }
                      if (squareNumber == 5) {
                        for (var d = 3; d <= 5; d++) {
                          squareChosen.add(sudoku[i][d]);
                        }
                      }
                      if (squareNumber == 6) {
                        for (var d = 6; d <= 8; d++) {
                          squareChosen.add(sudoku[i][d]);
                        }
                      }
                    }
                    if (i >= 6 && i <= 8) {
                      if (squareNumber == 7) {
                        for (var d = 0; d <= 2; d++) {
                          squareChosen.add(sudoku[i][d]);
                        }
                      }
                      if (squareNumber == 8) {
                        for (var d = 3; d <= 5; d++) {
                          squareChosen.add(sudoku[i][d]);
                        }
                      }
                      if (squareNumber == 9) {
                        for (var d = 6; d <= 8; d++) {
                          squareChosen.add(sudoku[i][d]);
                        }
                      }
                    }
                  }
                  log("squareChosen");
                  log(squareChosen.toString());
                  log("Linea horizontal");
                  log(horizontalLine.toString());
                  log("Linea Vertical");
                  log(verticalLine.toString());
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
