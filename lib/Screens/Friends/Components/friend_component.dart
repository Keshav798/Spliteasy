import 'package:flutter/material.dart';

class FriendComponent extends StatefulWidget {
  final String name;
  final double money;
  const FriendComponent({
      Key? key,
      required this.name,
      required this.money,
    }) : super(key: key);

  @override
  State<FriendComponent> createState() => _FriendComponentState();
}

class _FriendComponentState extends State<FriendComponent> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        key: widget.key,
        title: Text(widget.name),
        subtitle: Text(
          widget.money > 0
              ? "owes you ₹${widget.money}"
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