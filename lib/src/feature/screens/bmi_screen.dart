import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_health_app/src/feature/widgets/my_health_app_drawer.dart';

class BmiScreen extends StatefulWidget {
  @override
  _BmiScreenState createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  double? _bmi;
  String? _category;

  void _calculateBMI() {
    final double weight = double.tryParse(_weightController.text) ?? 0;
    final double height = double.tryParse(_heightController.text) ?? 0;
    if (weight > 0 && height > 0) {
      final double heightInMeters = height / 100;
      setState(() {
        _bmi = weight / (heightInMeters * heightInMeters);
        _category = _determineCategory(_bmi!);
      });
    }
  }

  String _determineCategory(double bmi) {
    if (bmi < 18.5)
      return "Underweight";
    else if (bmi < 25)
      return "normal";
    else if (bmi < 30)
      return "Overweight";
    else
      return "Obese";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyHealthAppDrawer(),
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            context.go('/');
          },
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(1.0),
            ),
            alignment: Alignment.bottomCenter,
            child: const Text(
              'BMI',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'weight (Kg)',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your weight in Kg'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                  labelText: 'Height (Cm)',
                  border: OutlineInputBorder(),
                  hintText: 'Enter your height in Cm'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            if (_bmi != null)
              Text('Your BMI: ${_bmi!.toStringAsFixed(2)} ($_category)',
                  style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
