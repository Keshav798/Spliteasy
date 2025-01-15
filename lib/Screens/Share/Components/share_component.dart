import 'package:flutter/material.dart';
import 'package:split_easy/Screens/Share/Components/clear_share_dialog.dart';
import 'package:split_easy/Screens/UtilityScreens/loading_page.dart';
import 'package:split_easy/Utils/Constants/colors.dart';


class ShareComponent extends StatefulWidget {
  final String shareId;
  final String name;
  final double money;
  final String split;
  final String date;
  final String time;
  final String title;
  final bool isCleared;
  final int index;

  const ShareComponent({
    Key? key,
    required this.shareId,
    required this.name,
    required this.money,
    required this.split,
    required this.date,
    required this.time,
    required this.index,
    required this.title,
    required this.isCleared
  }) : super(key: key);

  @override
  State<ShareComponent> createState() => _ShareComponentState();
}

class _ShareComponentState extends State<ShareComponent> {

  bool _isLoading=false;

  @override
  Widget build(BuildContext context) {
    // Alternate background color logic
    final backgroundColor = !widget.isCleared
        ? AppColors.colorFirst.withOpacity(0.5)
        : AppColors.colorThird.withOpacity(0.5);

    return _isLoading?LoadingPage(): LayoutBuilder(
      builder: (context,constraints) {
        final isWideScreen = constraints.maxWidth > 300;
        return GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return ClearShareDialog(shareId: widget.shareId);
              },
            );
          },
          child: Container(
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
                        widget.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8.0),
          
                // Money (owed or lended)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        widget.money > 0
                            ? "Lended ₹${widget.money.toStringAsFixed(2)}"
                            : widget.money == 0
                                ? "Cleared Up"
                                : "Owed ₹${widget.money.abs().toStringAsFixed(2)}",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: widget.money > 0
                              ? Colors.green
                              : widget.money == 0
                                  ? Colors.grey
                                  : Colors.red,
                        ),
                      ),
                    ),
                    Flexible(
                      child: Text(
                        widget.split,
                        style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Colors.white70,
                        ),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.end,
                      ),
                      )
                  ],
                ),
                const SizedBox(height: 8.0),
          
                // Date and Button
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
                    isWideScreen?GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return ClearShareDialog(shareId: widget.shareId);
                          },
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: widget.isCleared?AppColors.colorThird:AppColors.colorFirst,
                          borderRadius: BorderRadius.circular(8),
                          
                        ),
                        child: Text(
                          widget.isCleared?"Cleared":"Clear off",
                          style: const TextStyle(color: Colors.white),
                        ),
                    ),
                    ):SizedBox(),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
 