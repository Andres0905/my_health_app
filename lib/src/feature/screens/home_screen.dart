import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_health_app/src/feature/widgets/my_health_app_drawer.dart';

class HomeScreen extends StatelessWidget {
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(1.0),
            ),
            alignment: Alignment.bottomCenter,
            child: const Text(
              'WELCOME TO MY APP',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.push('/age'),
              child: Text('Calculate Age'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push('/bmi'),
              child: Text('Calculate BMI'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push('/zodiac'),
              child: Text('Calculate Zodiac'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => context.push('/cat'),
              child: Text('Calculator'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
