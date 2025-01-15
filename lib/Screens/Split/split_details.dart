import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_easy/Providers/user_provider.dart';
import 'package:split_easy/Screens/Split/Components/add_share_dialog.dart';
import 'package:split_easy/Screens/UtilityScreens/loading_page.dart';
import 'package:split_easy/Utils/API/api_helper.dart';
import 'package:split_easy/Utils/Constants/colors.dart';
import 'package:split_easy/Utils/Constants/measurments.dart';
import 'package:split_easy/Models/share_model.dart';
import 'package:split_easy/Providers/share_provider.dart';
import 'package:split_easy/Screens/Share/Components/share_component.dart';
import 'package:split_easy/Utils/SharedPreferences/shared_preferences_helper.dart';

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
  bool _isLoading=false;

  String splitName = "";
  List<String> participants = [];
  double amount = -9999;
  String creatorName = "";
  dynamic users=[];

  List<Share> shares = [];
  String searchQuery = "";
  String filterOption = "All";

  List<Share> get filteredShares {
    List<Share> filtered = shares;

    // Apply search
    if (searchQuery.isNotEmpty) {
      filtered = filtered.where((share) {
        String name=share.isPrimary!?share.userSecondary!.userName!: share.userPrimary!.userName!;
        return name
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

  Future<void> getStaticSplitData() async{
    setState(() {
      _isLoading=true;
    });
    Map<String,dynamic>? data=await ApiHelper.getStaticSplitData(widget.splitId);
    
    splitName=data!["title"];
    creatorName=data["createdBy"]["name"];
    users=data["participants"];
    for(dynamic userObject in users) participants.add(userObject["name"] as String);
    setState(() {
      _isLoading=false;
    });
  }
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getStaticSplitData();
  }
  
  @override
  Widget build(BuildContext context) {

    shares=Provider.of<ShareProvider>(context).getSplitShares(widget.splitId);
    amount=Provider.of<UserProvider>(context).getSplitAmount(widget.splitId) as double;

    return _isLoading?LoadingPage():Scaffold(
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
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                splitName,
                                style: const TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 1.2,
                                ),
                                overflow: TextOverflow.ellipsis, // Add ellipsis for long text
                                maxLines: 2, // Limit the text to 2 lines
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.colorFirst,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
                            textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onPressed: () async{
                            String? currentUserId=await SharedPreferencesHelper.getUserId();
                            users = users.where((user) => user['userId'] != currentUserId).toList();
                            showDialog(
                              context: context,
                              builder: (context) => AddShareDialog(users: users,splitId: widget.splitId,),
                            );
                          },
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(Icons.add, color: Colors.white),
                              SizedBox(width: 8),
                              Text("Add Share", style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        )
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
                        hintText: "Search by name or title",
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
                      childAspectRatio: isWideScreen ? childAspectRatioForSHareComponent_WideScreen : childAspectRatioForSHareComponent_SmallScreen,
                    ),
                    itemBuilder: (context, index) {
                      return ShareComponent(
                        shareId: filteredShares[index].shareId!,
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
            ],
          ),
        ),
      ),
    );
  }

}
