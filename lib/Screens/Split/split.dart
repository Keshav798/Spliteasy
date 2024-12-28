import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:split_easy/Screens/Split/Components/split_component.dart';
import 'package:split_easy/Utils/split_data_encoder.dart';


class SplitPage extends StatefulWidget {
  const SplitPage({Key? key}) : super(key: key);

  @override
  State<SplitPage> createState() => _SplitPageState();
}

class _SplitPageState extends State<SplitPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <GestureDetector>[
        GestureDetector(
          child: SplitComponent(
            title: "Manali",
            money: 345.87,
            index: 0,
          ),
          onTap: (){
            String encodedSplitDetails = encodeSplitDetails("testId");
            context.go('/split/$encodedSplitDetails');  // Navigates and updates the URL
          },
        ),
        GestureDetector(
          child: SplitComponent(
            title: "Rent",
            money: -2500,
            index: 1,
          ),
        ),
        GestureDetector(
          child: SplitComponent(
            title: "Rishikesh",
            money: 1500,
            index: 0,
          ),
        ),
        GestureDetector(
          child: SplitComponent(
            title: "Dinner",
            money: 0,
            index: 1,
          ),
        ),
      ],
    );
  }
}
