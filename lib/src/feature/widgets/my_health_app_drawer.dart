import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHealthAppDrawer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('My Health App'),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context);
              context.go('/');
            },
          ),
          ListTile(
            title: Text('BMI Calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/bmi');
            },
          ),
          ListTile(
            title: Text('Age Calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/age');
            },
          ),
          ListTile(
            title: Text('Zodiac Calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/zodiac');
            },
          ),
          ListTile(
            title: Text('Age Cat Calculator'),
            onTap: () {
              Navigator.pop(context);
              context.go('/cat');
            },
          ),
        ],
      ),
    );
  }
}
