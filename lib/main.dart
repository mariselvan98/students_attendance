import 'package:attendance/widget/custom_calender.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const HomeCalendarPage(),
    );
  }
}

class HomeCalendarPage extends StatefulWidget {
  const HomeCalendarPage({super.key});

  @override
  _HomeCalendarPageState createState() => _HomeCalendarPageState();
}

class _HomeCalendarPageState extends State<HomeCalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Calendar Example'),
      ),
      body: const CustomCalender(),
      // I don't use Map method in data spliting from response
      // Using Map method in Model file only .
      // We have done the work with gridview Index based
    );
  }
}
