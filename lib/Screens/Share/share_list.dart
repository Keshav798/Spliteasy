import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_easy/Constants/colors.dart';
import 'package:split_easy/Constants/measurments.dart';
import 'package:split_easy/Models/share_model.dart';
import 'package:split_easy/Providers/share_provider.dart';
import 'package:split_easy/Screens/Share/Components/share_component.dart';

class ShareList extends StatefulWidget {
  const ShareList({Key? key}) : super(key: key);

  @override
  State<ShareList> createState() => _ShareListState();
}

class _ShareListState extends State<ShareList> {
  List<Share> shares = [];

  String searchQuery = "";
  String filterOption = "All";

  // Filtered and searched list
  List<Share> get filteredShares {
    List<Share> filtered = shares;

    // Apply search
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((share) {
        String name=share.isPrimary!?share.userSecondary!.userName!: share.userPrimary!.userName!;
        return name
                .toLowerCase()
                .contains(searchQuery.toLowerCase()) ||
            share.split!.splitName!
                .toLowerCase()
                .contains(searchQuery.toLowerCase()) || 
                share.title!
                .toLowerCase()
                .contains(searchQuery.toLowerCase());
      }).toList();
    }

    // Apply filter
    if (filterOption == "owed first") {
      filtered.sort((a, b) => (a.amount! < 0 ? 0 : 1)
          .compareTo(b.amount! < 0 ? 0 : 1));
    } else if (filterOption == "lended first") {
      filtered.sort((a, b) => (a.amount! > 0 ? 0 : 1)
          .compareTo(b.amount! > 0 ? 0 : 1));
    } else if (filterOption == "newest first") {
      filtered.sort((a, b) => DateTime.parse(b.createdAt!)
          .compareTo(DateTime.parse(a.createdAt!)));
    } else if (filterOption == "oldest first") {
      filtered.sort((a, b) => DateTime.parse(a.createdAt!)
          .compareTo(DateTime.parse(b.createdAt!)));
    } else if (filterOption == "cleared first") {
      filtered.sort((a, b) => (a.isCleared==true?0:1)
          .compareTo(b.isCleared==true?0:1));
    } else if (filterOption == "uncleared first") {
      filtered.sort((a, b) => (a.isCleared==true?1:0)
          .compareTo(b.isCleared==true?1:0));
    }

    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    shares=Provider.of<ShareProvider>(context).shares;
  //   shares=[
  //   {
  //     "name": "Anshul",
  //     "money": 345.87,
  //     "split": "Vacation",
  //     "date": "2024-12-01",
  //     "time": "10:45 AM",
  //     "title":"Lunch",
  //     "isCleared":false
  //   },
  //   {
  //     "name": "Sakshi",
  //     "money": -2500.0,
  //     "split": "Manali Trip",
  //     "date": "2024-12-05",
  //     "time": "12:00 PM",
  //     "title":"Cab",
  //     "isCleared":true
  //   },
  //   {
  //     "name": "Rohan",
  //     "money": 1500.0,
  //     "split": "Food",
  //     "date": "2024-12-20",
  //     "time": "08:30 PM",
  //     "title":"Dinner",
  //     "isCleared":true
  //   },
  //   // Add more shares as needed
  // ];

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
                    hintText: "Search by name , split or title",
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
                  const PopupMenuItem(
                    value: "cleared first",
                    child: Text("Cleared First"),
                  ),
                  const PopupMenuItem(
                    value: "uncleared first",
                    child: Text("Uncleared First"),
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
                    ? childAspectRatioForSHareComponent_WideScreen
                    : childAspectRatioForSHareComponent_SmallScreen;

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
                      name: filteredShares[index].isPrimary!?filteredShares[index].userSecondary!.userName!: filteredShares[index].userPrimary!.userName!,
                      money: filteredShares[index].amount!.toDouble(),
                      split: filteredShares[index].split!.splitName!,
                      date: DateTime.parse(filteredShares[index].createdAt!).day.toString() +"-"+DateTime.parse(filteredShares[index].createdAt!).month.toString()+"-"+DateTime.parse(filteredShares[index].createdAt!).year.toString(),
                      time: DateTime.parse(filteredShares[index].createdAt!).hour.toString() +":"+DateTime.parse(filteredShares[index].createdAt!).minute.toString(),
                      index: index,
                      isCleared: filteredShares[index].isCleared!,
                      title: filteredShares[index].title!,
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
