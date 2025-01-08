import 'package:flutter/material.dart';
import 'package:split_easy/Utils/Constants/colors.dart';

class SplitComponent extends StatefulWidget {
  final String title;
  final double money;
  final int index; // To alternate colors

  const SplitComponent({
    Key? key,
    required this.title,
    required this.money,
    required this.index,
  }) : super(key: key);

  @override
  State<SplitComponent> createState() => _SplitComponentState();
}

class _SplitComponentState extends State<SplitComponent> {
  @override
  Widget build(BuildContext context) {
    // Alternate background color logic
    final backgroundColor = widget.index % 2 == 0
        ? AppColors.colorFirst.withOpacity(0.5)
        : AppColors.colorThird.withOpacity(0.5);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
      child: FractionallySizedBox(
        alignment: Alignment.topLeft,
        widthFactor: 0.49,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: ListTile(
            key: widget.key,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
            title: Text(
              widget.title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              widget.money > 0
                  ? "You will collect ₹${widget.money}"
                  : widget.money == 0
                      ? "Cleared Up"
                      : "You owe ₹${(widget.money).abs()}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: widget.money > 0
                    ? Colors.green
                    : widget.money == 0
                        ? Colors.grey
                        : Colors.red,
              ),
            ),
            // trailing: Row(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     IconButton(
            //       icon: const Icon(Icons.edit),
            //       color: AppColors.colorFirst,
            //       onPressed: () {},
            //     ),
            //     IconButton(
            //       icon: const Icon(Icons.delete),
            //       color: Colors.red,
            //       onPressed: () {},
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }
}
