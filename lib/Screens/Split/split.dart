import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:split_easy/Models/user_model.dart';
import 'package:split_easy/Providers/user_provider.dart';
import 'package:split_easy/Screens/Split/Components/split_component.dart';
import 'package:split_easy/Utils/Encoders/split_data_encoder.dart';

 
class SplitPage extends StatefulWidget {
  const SplitPage({Key? key}) : super(key: key);

  @override
  State<SplitPage> createState() => _SplitPageState();
}

class _SplitPageState extends State<SplitPage> {

    @override
    Widget build(BuildContext context) {
      return Consumer<UserProvider>(
        builder: (context, value, child) {
          User? user=value.user;
          List<UserSplit>? splits=user!.splitList;
          return ListView.builder(
            itemCount: splits?.length,
            itemBuilder: (context,index){
              return GestureDetector(
                child: SplitComponent(
                  title: splits?[index].splitTitle??"No title",
                  money: splits?[index].amount?.toDouble()??0,
                  index: index,
                ),
                onTap: (){
                  String encodedSplitDetails = encodeSplitDetails(splits?[index].splitId??"testId");
                  context.go('/split/$encodedSplitDetails');  // Navigates and updates the URL
                },
              );
            }
            );
        },
      );
    }
}
