import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:split_easy/Models/share_model.dart';
import 'package:split_easy/Models/user_model.dart';
import 'package:split_easy/Providers/share_provider.dart';
import 'package:split_easy/Providers/user_provider.dart';
import 'package:split_easy/Utils/Routes/routes.dart';
import 'package:split_easy/Screens/UtilityScreens/loading_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isLoading = true;
  bool isValidated = true;

  Future<bool> getValidation() async {
    await Future.delayed(Duration(seconds: 5));
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token")!=null;
  }

  Future<void> initialize() async {
    debugPrint("Function called");
    isValidated = await getValidation();
     Map<String, dynamic> userJson = {
              "_id": "676a83d55a1fa2abc876cc79",
              "name": "Keshav",
              "email": "keshav@company.com",
              "password": "\$2b\$10\$mL2Ntf996xpXbFFdRCz7nuFOuWuP3UfoJkSaPbyCw96A2SecYSHEW",
              "totalOwed": 0,
              "totalLended": 200,
              "userId": "676a83d55a1fa2abc876cc7a",
              "splitList": [
                {
                  "splitId": "676a84985a1fa2abc876cc97",
                  "splitTitle": "Manali Trip",
                  "amount": 200,
                  "_id": "676a84985a1fa2abc876cc99"
                }
              ],
              "friendList": [
                {
                  "userId": "676a83e05a1fa2abc876cc7d",
                  "name": "Anshul",
                  "amount": 0,
                  "shareList": [],
                  "_id": "676a84425a1fa2abc876cc86"
                },
                {
                  "userId": "676a83ef5a1fa2abc876cc80",
                  "name": "Saksham",
                  "amount": 200,
                  "shareList": ["6776b2f51781cee6faea2ad6"],
                  "_id": "676a98bcda74edc292e28087"
                }
              ],
              "createdAt": "2024-12-24T09:50:13.767Z",
              "updatedAt": "2025-01-02T15:38:29.616Z",
              "__v": 3
            };
    User user = User.fromJson(userJson);
    context.read<UserProvider>().setUser(user);

    List<Map<String,dynamic>> shareListJson=[{
            "userPrimary": {
                "userId": "676a83d55a1fa2abc876cc7a",
                "userName": "Keshav"
            },
            "userSecondary": {
                "userId": "676a83ef5a1fa2abc876cc80",
                "userName": "Saksham"
            },
            "split": {
                "splitName": "Manali Trip",
                "splitId": "676a84985a1fa2abc876cc97"
            },
            "_id": "6776b2f51781cee6faea2ad5",
            "title": "Hotel",
            "isCleared": false,
            "amount": 200,
            "shareId": "6776b2f51781cee6faea2ad6",
            "createdAt": "2025-01-02T15:38:29.353Z",
            "updatedAt": "2025-01-02T15:38:29.353Z",
            "__v": 0
        }];

      List<Share> shares=[];
      for(Map<String,dynamic> json in shareListJson) {
        Share currShare=Share.fromJson(json);
        currShare.isPrimary=true; //add logic
        currShare.amount=currShare.isPrimary!?currShare.amount:currShare.amount!*-1;
        shares.add(currShare);
      }
      context.read<ShareProvider>().setShares(shares);

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    if(_isLoading){
      return MaterialApp(home: LoadingPage());
    }

    final router=isValidated
                ? authenticatedRoute // Pass current route
                : nonAuthenticatedRoute;

    return MaterialApp.router(
            theme: ThemeData(brightness: Brightness.dark),
            title: 'Split Easy',
            routerConfig: router,
          );
  }
}
