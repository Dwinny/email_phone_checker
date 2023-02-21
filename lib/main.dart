import 'package:flutter/material.dart';
import 'Email_folder/email_check.dart';
import 'Phone_folder/phone_check.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  late TabController controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue)
              .copyWith(secondary: Colors.yellow),
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Tab ${controller.index + 1}'),
            centerTitle: true,
            bottom: TabBar(controller: controller, tabs: [
              Tab(
                text: 'Email Checker',
                icon: Icon(Icons.email),
              ),
              Tab(
                text: 'Phone no Checker',
                icon: Icon(Icons.phone),
              )
            ]),
          ),
          body: TabBarView(
              controller: controller, children: [Homepage(), phonecheck()]),
        ));
  }
}
