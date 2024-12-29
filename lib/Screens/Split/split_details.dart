import 'package:flutter/material.dart';
import 'package:split_easy/Constants/colors.dart';
import 'package:split_easy/Screens/Share/Components/share_component.dart';

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
  String splitName = "Manali Trip";
  List<String> participants = [
    "Keshav",
    "Sakshi",
    "Aman",
    "Keshav",
    "Sakshi",
    "Aman","Keshav",
    "Sakshi",
    "Aman","Keshav",
    "Sakshi",
    "Aman","Keshav",
    "Sakshi",
    "Aman","Keshav",
    "Sakshi",
    "Aman","Keshav",
    "Sakshi",
    "Aman","Keshav",
    "Sakshi",
    "Aman","Keshav",
    "Sakshi",
    "Aman","Keshav",
    "Sakshi",
    "Aman","Keshav",
    "Sakshi",
    "Aman",
    // Add more participants as needed
  ];
  double amount = -345;
  String creatorName = "Keshav";

  final List<Map<String, dynamic>> shares = [
    {
      "name": "Anshul",
      "money": 345.87,
      "split": "Vacation",
      "date": "2024-12-01",
      "time": "10:45 AM"
    },
    {
      "name": "Sakshi",
      "money": -2500.0,
      "split": "Rent",
      "date": "2024-12-05",
      "time": "12:00 PM"
    },
    {
      "name": "Rohan",
      "money": 1500.0,
      "split": "Food",
      "date": "2024-12-20",
      "time": "08:30 PM"
    },
    {
      "name": "Anshul",
      "money": 345.87,
      "split": "Vacation",
      "date": "2024-12-01",
      "time": "10:45 AM"
    },
    {
      "name": "Sakshi",
      "money": -2500.0,
      "split": "Rent",
      "date": "2024-12-05",
      "time": "12:00 PM"
    },
    {
      "name": "Rohan",
      "money": 1500.0,
      "split": "Food",
      "date": "2024-12-20",
      "time": "08:30 PM"
    },
    {
      "name": "Anshul",
      "money": 345.87,
      "split": "Vacation",
      "date": "2024-12-01",
      "time": "10:45 AM"
    },
    {
      "name": "Sakshi",
      "money": -2500.0,
      "split": "Rent",
      "date": "2024-12-05",
      "time": "12:00 PM"
    },
    {
      "name": "Rohan",
      "money": 1500.0,
      "split": "Food",
      "date": "2024-12-20",
      "time": "08:30 PM"
    },
    {
      "name": "Anshul",
      "money": 345.87,
      "split": "Vacation",
      "date": "2024-12-01",
      "time": "10:45 AM"
    },
    {
      "name": "Sakshi",
      "money": -2500.0,
      "split": "Rent",
      "date": "2024-12-05",
      "time": "12:00 PM"
    },
    {
      "name": "Rohan",
      "money": 1500.0,
      "split": "Food",
      "date": "2024-12-20",
      "time": "08:30 PM"
    },
    {
      "name": "Anshul",
      "money": 345.87,
      "split": "Vacation",
      "date": "2024-12-01",
      "time": "10:45 AM"
    },
    {
      "name": "Sakshi",
      "money": -2500.0,
      "split": "Rent",
      "date": "2024-12-05",
      "time": "12:00 PM"
    },
    {
      "name": "Rohan",
      "money": 1500.0,
      "split": "Food",
      "date": "2024-12-20",
      "time": "08:30 PM"
    },
    {
      "name": "Anshul",
      "money": 345.87,
      "split": "Vacation",
      "date": "2024-12-01",
      "time": "10:45 AM"
    },
    {
      "name": "Sakshi",
      "money": -2500.0,
      "split": "Rent",
      "date": "2024-12-05",
      "time": "12:00 PM"
    },
    {
      "name": "Rohan",
      "money": 1500.0,
      "split": "Food",
      "date": "2024-12-20",
      "time": "08:30 PM"
    },
    // Add more shares as needed
  ];

  String searchQuery = "";
  String filterOption = "All";

  List<Map<String, dynamic>> get filteredShares {
    List<Map<String, dynamic>> filtered = shares;

    // Apply search
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((share) {
        return share["name"]
                .toLowerCase()
                .contains(searchQuery.toLowerCase()) ||
            share["split"]
                .toLowerCase()
                .contains(searchQuery.toLowerCase());
      }).toList();
    }

    // Apply filter
    if (filterOption == "owed first") {
      filtered.sort((a, b) => (a["money"] < 0 ? 0 : 1)
          .compareTo(b["money"] < 0 ? 0 : 1));
    } else if (filterOption == "lended first") {
      filtered.sort((a, b) => (a["money"] > 0 ? 0 : 1)
          .compareTo(b["money"] > 0 ? 0 : 1));
    } else if (filterOption == "newest first") {
      filtered.sort((a, b) => DateTime.parse(b["date"])
          .compareTo(DateTime.parse(a["date"])));
    } else if (filterOption == "oldest first") {
      filtered.sort((a, b) => DateTime.parse(a["date"])
          .compareTo(DateTime.parse(b["date"])));
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorFourth,
      appBar: AppBar(
        backgroundColor: AppColors.colorSecond,
        title: const Text(
          "Split Details",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Split Details Header
              Container(
                padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 20.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.colorThird.withOpacity(0.8),
                      AppColors.colorSecond.withOpacity(0.5),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 12,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.event_note,
                          color: Colors.white,
                          size: 28,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            splitName,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white70,
                          size: 20,
                        ),
                        const SizedBox(width: 6),
                        Text(
                          "Created by: $creatorName",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        color: amount > 0
                            ? Colors.green.withOpacity(0.2)
                            : amount == 0
                                ? Colors.grey.withOpacity(0.2)
                                : Colors.red.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            amount > 0
                                ? Icons.arrow_upward
                                : amount == 0
                                    ? Icons.check
                                    : Icons.arrow_downward,
                            color: amount > 0
                                ? Colors.green
                                : amount == 0
                                    ? Colors.grey
                                    : Colors.red,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              amount > 0
                                  ? "You lended ₹${amount.toStringAsFixed(2)}"
                                  : amount == 0
                                      ? "Amount Cleared"
                                      : "You owe ₹${amount.abs().toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: amount > 0
                                    ? Colors.green
                                    : amount == 0
                                        ? Colors.grey
                                        : Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

                 // Participants Section
              Text(
                "Participants:",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: participants
                    .map(
                      (participant) => Chip(
                        label: Text(
                          participant,
                          style: const TextStyle(color: Colors.white),
                        ),
                        backgroundColor: AppColors.colorFirst,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),

              // Search Bar and Filter Options
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        setState(() {
                          searchQuery = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Search by name or split",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  PopupMenuButton<String>(
                    onSelected: (value) {
                      setState(() {
                        filterOption = value;
                      });
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(
                        value: "All",
                        child: Text("All"),
                      ),
                      const PopupMenuItem(
                        value: "owed first",
                        child: Text("Owed First"),
                      ),
                      const PopupMenuItem(
                        value: "lended first",
                        child: Text("Lended First"),
                      ),
                      const PopupMenuItem(
                        value: "newest first",
                        child: Text("Newest First"),
                      ),
                      const PopupMenuItem(
                        value: "oldest first",
                        child: Text("Oldest First"),
                      ),
                    ],
                    child: Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: AppColors.colorFirst,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Icon(Icons.filter_list, color: Colors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Shares Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  final isWideScreen = constraints.maxWidth > 600;
                  final crossAxisCount = isWideScreen ? 4 : 2;

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: filteredShares.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 12.0,
                      mainAxisSpacing: 12.0,
                      childAspectRatio: isWideScreen ? 2.2 : 1.5,
                    ),
                    itemBuilder: (context, index) {
                      final share = filteredShares[index];
                      return ShareComponent(
                        name: share["name"],
                        money: share["money"],
                        split: share["split"],
                        date: share["date"],
                        time: share["time"],
                        index: index,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
