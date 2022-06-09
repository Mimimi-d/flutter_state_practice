import 'package:flutter/material.dart';
import 'package:flutter_state_practice/state_practice/stateful_widget/stateful_home_page.dart';

import 'widgets/navigate_button.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter State Managements',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              NavigateButton(
                navigateTo: StatefulWidgetPage(),
                title: 'Stateful Widget',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
