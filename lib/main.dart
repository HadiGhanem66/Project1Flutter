import 'package:flutter/material.dart';

void main() {
  runApp(PayrollApp());
}

class PayrollApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PayrollPage(),
    );
  }
}

class PayrollPage extends StatefulWidget {
  @override
  _PayrollPageState createState() => _PayrollPageState();
}

class _PayrollPageState extends State<PayrollPage> {
 
  final TextEditingController grossSalaryController = TextEditingController();
  final TextEditingController taxRateController = TextEditingController();
  final TextEditingController deductionsController = TextEditingController();

  String netSalary = "0.00";

  void calculateNetSalary() {
    final double grossSalary =
        double.tryParse(grossSalaryController.text) ?? 0.0;
    final double taxRate = double.tryParse(taxRateController.text) ?? 0.0;
    final double deductions =
        double.tryParse(deductionsController.text) ?? 0.0;

    final double tax = grossSalary * (taxRate / 100);
    final double net = grossSalary - tax - deductions;

    setState(() {
      netSalary = net.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inspirify"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            TextField(
              controller: grossSalaryController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Gross Salary",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
           
            TextField(
              controller: taxRateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Tax Rate (%)",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            TextField(
              controller: deductionsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Deductions",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 24),
            
            ElevatedButton(
              onPressed: calculateNetSalary,
              child: Text("Calculate Net Salary"),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
            SizedBox(height: 24),
          
            Text(
              "Net Salary: \$ $netSalary",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
