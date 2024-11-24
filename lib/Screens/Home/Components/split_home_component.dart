import 'package:flutter/material.dart';

class SplitHomeComponenet extends StatefulWidget {
  final String title;
  final double money;

  const SplitHomeComponenet({
    Key? key,
    required this.title,
    required this.money,
  }) : super(key: key);

  @override
  State<SplitHomeComponenet> createState() => _SplitHomeComponenetState();
}

class _SplitHomeComponenetState extends State<SplitHomeComponenet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        key: widget.key,
        title: Text(widget.title),
        subtitle: Text(
          widget.money > 0
              ? "You will collect ₹${widget.money}"
              : widget.money == 0
                  ? "Cleared Up"
                  : "You owe ₹${(widget.money).abs()}",
          style: TextStyle(
              color: widget.money > 0
                  ? Colors.green
                  : widget.money == 0
                      ? Colors.grey
                      : Colors.red),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
