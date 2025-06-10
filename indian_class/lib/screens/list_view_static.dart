import 'package:flutter/material.dart';

class MyListViewStatic extends StatelessWidget {
  const MyListViewStatic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //! The ListView has a property of `SCROLL` so u can use it to wrap another
      //! widget to add this property
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.alarm_sharp),
            title: Text('Sales'),
            subtitle: Text('Sales of the Week'),
            trailing: Icon(Icons.add),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.monetization_on_rounded),
            title: Text('Profit'),
            subtitle: Text('Valeu in deposit'),
            trailing: Text("12.000K"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
