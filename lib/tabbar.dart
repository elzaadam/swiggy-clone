import 'package:flutter/material.dart';
import 'package:myproject/firstscreen.dart';
import 'package:myproject/secondscreen.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                  title: const Text("Tab Bar"),
                  bottom: const TabBar(
                    tabs: [
                      Tab(icon: Icon(Icons.contacts), text: ("Tab 1")),
                      Tab(icon: Icon(Icons.camera), text: ("Tab 2")),
                    ],
                  ),
                ),
                body: const TabBarView(
                  children: [
                    Firstscreen(),
                    Secondscreen(),
                  ],
                ))));
  }
}
