import 'package:flutter/material.dart';

void main() {
  runApp(FFScalc());
}

class FFScalc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fcatorial,Fibonacci and sum calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MathOperationsScreen(),
    );
  }
}

class MathOperationsScreen extends StatefulWidget {
  @override
  _MathOperationsScreenState createState() => _MathOperationsScreenState();
}

class _MathOperationsScreenState extends State<MathOperationsScreen> {
  TextEditingController _numberController = TextEditingController();
  int _factorial = 1;
  List<int> _fibonacciSeries = [];
  int _sum = 0;
 // Function to calculate factorial of a number
  Future _calculateFactorial() async {
    int number = int.tryParse(_numberController.text) ?? 0;
    int result = 1;
    for (int i = 1; i <= number; i++) {
      result *= i;
    }
    setState(() {
      _factorial = result;
    });
  }
 // Function to create fibonacci series
  Future _generateFibonacciSeries() async {
    int n = int.tryParse(_numberController.text) ?? 0;
    List<int> series = [0, 1];
    for (int i = 2; i < n; i++) {
      series.add(series[i - 1] + series[i - 2]);
    }
    setState(() {
      _fibonacciSeries = series;
    });
  }
 // Function to calculate sum of a number
  Future _calculateSum() async {
    int number = int.tryParse(_numberController.text) ?? 0;
    int sum = 0;
    for (int i = 1; i <= number; i++) {
      sum += i;
    }
    setState(() {
      _sum = sum;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fcatorial,Fibonacci and sum calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _numberController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter a number'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed:() { _calculateFactorial();_calculateSum();_generateFibonacciSeries();
              },
              child: Text('Calculate'),
            ),
                SizedBox(height: 16),
            Text(
              'Factorial: $_factorial',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
                SizedBox(height: 16),
            Text(
              'Fibonacci Series: ${_fibonacciSeries.join(', ')}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
                SizedBox(height: 16),
            Text(
              'Sum: $_sum',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}


