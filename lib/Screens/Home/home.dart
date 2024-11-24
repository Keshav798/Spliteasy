import 'package:flutter/material.dart';
import 'package:split_easy/Screens/Home/Components/split_home_component.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <SplitHomeComponenet>[
        SplitHomeComponenet(
          title: "Manali",
          money: 345.87,
        ),
        SplitHomeComponenet(
          title: "Rent",
          money: -2500,
        ),
        SplitHomeComponenet(
          title: "Rishikesh",
          money: 1500,
        ),
        SplitHomeComponenet(
          title: "Dinner",
          money: 0,
        ),
      ],
    );
  }
}
