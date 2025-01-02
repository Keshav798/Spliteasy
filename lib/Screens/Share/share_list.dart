import 'package:flutter/material.dart';
import 'package:split_easy/Constants/colors.dart';
import 'package:split_easy/Screens/Share/Components/share_component.dart';

class ShareList extends StatefulWidget {
  const ShareList({Key? key}) : super(key: key);

  @override
  State<ShareList> createState() => _ShareListState();
}

class _ShareListState extends State<ShareList> {
  List<Map<String, dynamic>> shares = [];

  String searchQuery = "";
  String filterOption = "All";

  // Filtered and searched list
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
    shares=[
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

    return Column(
      children: [
        // Search Bar and Filter Button
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
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
              const SizedBox(width: 8.0),
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
        ),

        // List/Grid of Shares
        Expanded(
          child: Container(
            color: AppColors.colorThird.withOpacity(0.4), // Background color matching
            width: MediaQuery.of(context).size.width * 0.5, // 50% of the screen width
            padding: const EdgeInsets.all(12.0),
            child: LayoutBuilder(
              builder: (context, constraints) {
                // Determine number of tiles per row and aspect ratio dynamically
                final isWideScreen = constraints.maxWidth > 600;
                final childAspectRatio = isWideScreen
                    ? constraints.maxWidth / (constraints.maxHeight / 2.2)
                    : 1.5;

                return GridView.builder(
                  itemCount: filteredShares.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: isWideScreen ? 2 : 1, // 2 tiles per row for wide screens
                    mainAxisSpacing: 12.0,
                    crossAxisSpacing: 12.0,
                    childAspectRatio: childAspectRatio,
                  ),
                  itemBuilder: (context, index) {
                    return ShareComponent(
                      name: filteredShares[index]["name"],
                      money: filteredShares[index]["money"],
                      split: filteredShares[index]["split"],
                      date: filteredShares[index]["date"],
                      time: filteredShares[index]["time"],
                      index: index,
                    );
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
