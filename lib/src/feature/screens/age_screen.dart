import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_health_app/src/feature/widgets/my_health_app_drawer.dart';

class AgeScreen extends StatefulWidget {
  @override
  _AgeScreenState createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  DateTime? _selectedDate;
  int? _age;

  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
        _age = _calculateAge(pickedDate);
      });
    });
  }

  int _calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month &&
            currentDate.day < birthDate.day)) {
      age--;
    }
    return age;
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
              color: Colors.blue,
              borderRadius: BorderRadius.circular(1.0),
            ),
            alignment: Alignment.bottomCenter,
            child: const Text(
              'AGE',
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
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _presentDatePicker,
              child: Text(_selectedDate == null
                  ? 'Select your birthdate'
                  : 'Change birthdate (${_selectedDate!.toIso8601String().substring(0, 10)})'),
            ),
            const SizedBox(height: 20),
            if (_age != null)
              Text('You are $_age years old.',
                  style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
