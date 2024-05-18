import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_health_app/src/feature/widgets/my_health_app_drawer.dart';

class CatScreen extends StatefulWidget {
  @override
  _CatScreenState createState() => _CatScreenState();
}

class _CatScreenState extends State<CatScreen> {
  DateTime? _selectedDate;
  Age? _age;
  String? _catAge;

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
        _catAge = _determineCatAge(pickedDate);
      });
    });
  }

  Age _calculateAge(DateTime selectedDate) {
    DateTime currentDate = DateTime.now();

    int years = currentDate.year - selectedDate.year;
    int months = currentDate.month - selectedDate.month;
    int days = currentDate.day - selectedDate.day;

    if (months < 0 || (months == 0 && days < 0)) {
      years--;
      months += 12;
    }

    if (days < 0) {
      final lastMonthDate =
          DateTime(currentDate.year, currentDate.month - 1, selectedDate.day);
      final difference = currentDate.difference(lastMonthDate);
      days = difference.inDays;
      months--;
    }

    return Age(years, months, days);
  }

  String _determineCatAge(DateTime date) {
    int month = _age!.months;
    int year = _age!.years;
    int edad;
    if (year >= 3) {
      edad = ((year - 2) * 4 + 24);
      return "$edad Years";
    } else if (year == 2) {
      return "24 Years";
    } else if ((year < 2 && year > 1) || (month >= 6)) {
      return "21 Years";
    } else if ((year >= 1) && (month < 6)) {
      return "15 Years";
    } else if ((year <= 1) && (month >= 7)) {
      return "12 Years";
    } else if ((year <= 1) && (month >= 6)) {
      return "10 Years";
    } else if ((year <= 1) && (month >= 4)) {
      return "6 to 8 Years";
    } else if ((year <= 1) && (month >= 2)) {
      return "2 to 4 Years";
    } else if ((year <= 1) && (month >= 0)) {
      return "0 to 2 Years";
    }
    return "Unknown";
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
              color: Colors.orange,
              borderRadius: BorderRadius.circular(1.0),
            ),
            alignment: Alignment.bottomCenter,
            child: const Text(
              'AGE CAT',
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
                  ? 'select your cats date of birth'
                  : 'Change birthdate (${_selectedDate!.toIso8601String().substring(0, 10)})'),
            ),
            const SizedBox(height: 20),
            if (_selectedDate != null)
              Text(
                'Hello, your cat is $_catAge human years old.',
                style: const TextStyle(fontSize: 18),
              ),
          ],
        ),
      ),
    );
  }
}

class Age {
  final int years;
  final int months;
  final int days;

  Age(this.years, this.months, this.days);
}
