import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:split_easy/Models/share_model.dart';
import 'package:split_easy/Models/user_model.dart';
import 'package:split_easy/Providers/share_provider.dart';
import 'package:split_easy/Providers/user_provider.dart';
import 'package:split_easy/Utils/API/api_helper.dart';
import 'package:split_easy/Utils/Routes/routes.dart';
import 'package:split_easy/Screens/UtilityScreens/loading_page.dart';
import 'package:split_easy/Utils/SharedPreferences/shared_preferences_helper.dart';

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
    String? token = await SharedPreferencesHelper.getAuthToken();
    return token!=null;
  }

  Future<void> initialize() async {
    debugPrint("Function called");
    isValidated = await getValidation();
    if(!isValidated){
      setState(() {
        _isLoading = false;
      });
        return;
    }
    
    Map<String,dynamic>? userJson= await ApiHelper.getUser();
    if(userJson==null){
      //here there should be a logic to go back to login or error page
      return;
    }
    User user = User.fromJson(userJson);
    String? userId=user.userId;
    context.read<UserProvider>().setUser(user);

    List<dynamic>? shareListJson = await ApiHelper.getUserShares();
    if(shareListJson==null){
      //here there should be a logic to go back to login or error page
      return;
    }
    List<Share> shares=[];
    for(Map<String,dynamic> json in shareListJson) {
      Share currShare=Share.fromJson(json);
      currShare.isPrimary=currShare.userPrimary!.userId==userId;
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
