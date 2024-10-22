import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Manage the ans section
  int ans = 0;

  // Use TextEditingControllers for each input field
  TextEditingController add1Controller = TextEditingController();
  TextEditingController add2Controller = TextEditingController();

  // Store each value in the state
  int firstAddNum = 0;
  int secondAddNum = 0;

  String currentOperator = ' + ';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Add Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: add1Controller,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      firstAddNum = int.parse(value);
                    });
                  },
                ),
              ),
              Text(currentOperator),
              Expanded(
                child: TextField(
                  controller: add2Controller,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      secondAddNum = int.parse(value);
                    });
                  },
                ),
              ),

              Text(' = $ans'),
              // 3.a Add an IconButton here
              IconButton(
                onPressed: () {
                  setState(() {
                    ans = firstAddNum + secondAddNum;
                    currentOperator = ' + ';
                  });
                },
                icon: const Icon(Icons.add),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    // Clear the controllers
                    add1Controller.clear();
                    add2Controller.clear();
                    // Reset the state variables
                    firstAddNum = 0;
                    secondAddNum = 0;
                    ans = 0;
                    currentOperator = ' + ';
                  });
                },
                child: const Text('Clear Input'),
              ),
            ],
          ),

          // b.b Add the clear button

          // 3.c - Add the other operations
          // Minus Row
          ElevatedButton(
            onPressed: () {
              setState(() {
                ans = firstAddNum - secondAddNum;
                currentOperator = ' - ';
              });
            },
            child: const Text(' Subract '),
          ),
          // Multiplication Row
          ElevatedButton(
            onPressed: () {
              setState(() {
                ans = firstAddNum * secondAddNum;
                currentOperator = ' * ';
              });
            },
            child: const Text(' Multiply '),
          ),
          // Division Row
          ElevatedButton(
            onPressed: () {
              setState(() {
                ans = firstAddNum ~/ secondAddNum;
                currentOperator = ' / ';
              });
            },
            child: const Text(' Divide '),
          ),
        ],
      ),
    );
  }
}
