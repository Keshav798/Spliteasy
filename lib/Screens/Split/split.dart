import 'package:flutter/material.dart';
import 'package:split_easy/Screens/Split/Components/split_component.dart';


class SplitPage extends StatefulWidget {
  const SplitPage({Key? key}) : super(key: key);

  @override
  State<SplitPage> createState() => _SplitPageState();
}

class _SplitPageState extends State<SplitPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <SplitComponent>[
        SplitComponent(
          title: "Manali",
          money: 345.87,
          index: 0,
        ),
        SplitComponent(
          title: "Rent",
          money: -2500,
          index: 1,
        ),
        SplitComponent(
          title: "Rishikesh",
          money: 1500,
          index: 0,
        ),
        SplitComponent(
          title: "Dinner",
          money: 0,
          index: 1,
        ),
      ],
    );
  }
}
