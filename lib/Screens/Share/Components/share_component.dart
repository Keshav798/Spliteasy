import 'package:flutter/material.dart';
import 'package:split_easy/Constants/colors.dart';

class ShareComponent extends StatefulWidget {
  final String name;
  final double money;
  final String split;
  final String date;
  final String time;
  final int index;

  const ShareComponent({
    Key? key,
    required this.name,
    required this.money,
    required this.split,
    required this.date,
    required this.time,
    required this.index,
  }) : super(key: key);

  @override
  State<ShareComponent> createState() => _ShareComponentState();
}

class _ShareComponentState extends State<ShareComponent> {
  @override
  Widget build(BuildContext context) {
    // Alternate background color logic
    final backgroundColor = widget.index % 2 == 0
        ? AppColors.colorFirst.withOpacity(0.5)
        : AppColors.colorThird.withOpacity(0.5);

    return Container(
      constraints: const BoxConstraints(maxWidth: 500), // Limit max width
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
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Prevent unnecessary vertical stretching
        children: [
          // Name and Split
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  widget.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Flexible(
                child: Text(
                  widget.split,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),

          // Money (owed or lended)
          Text(
            widget.money > 0
                ? "You lended ₹${widget.money.toStringAsFixed(2)}"
                : widget.money == 0
                    ? "Cleared Up"
                    : "You owe ₹${widget.money.abs().toStringAsFixed(2)}",
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
          const SizedBox(height: 8.0),

          // Date and Time
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.date,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white54,
                ),
              ),
              Text(
                widget.time,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
