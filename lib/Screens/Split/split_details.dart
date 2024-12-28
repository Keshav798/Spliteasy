import 'package:flutter/material.dart';

class SplitDetails extends StatefulWidget {
  final String splitId;

  const SplitDetails({
    Key? key,
    required this.splitId,
  }) : super(key: key);

  @override
  State<SplitDetails> createState() => _SplitDetailsState();
}

class _SplitDetailsState extends State<SplitDetails> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text(widget.splitId) ,);
  }
}