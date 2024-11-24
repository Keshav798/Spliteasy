import 'package:flutter/material.dart';
import 'package:split_easy/Constants/colors.dart';
import 'package:split_easy/Screens/Friends/friend_list.dart';
import 'package:split_easy/Screens/Home/home.dart';
import 'package:split_easy/Screens/Profile/profile_component.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  bool _isProfileViewVisible =
      false; // State to control profile view visibility

  final List<Widget> _tabs = [HomePage(), FriendList()];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void toggleProfileView() {
    setState(() {
      _isProfileViewVisible = !_isProfileViewVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                    _pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    "Home",
                    style: TextStyle(
                      color:
                          _currentIndex == 0 ? Colors.white : Colors.grey[300],
                      fontWeight: _currentIndex == 0
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                    _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    "Friends",
                    style: TextStyle(
                      color:
                          _currentIndex == 1 ? Colors.white : Colors.grey[300],
                      fontWeight: _currentIndex == 1
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.notifications),
                ),
                GestureDetector(
                  onTap: toggleProfileView, // Toggle profile view visibility
                  child: CircleAvatar(
                    backgroundColor: AppColors.navBarBgColor,
                    child: const Icon(Icons.person),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: AppColors.navBarBgColor,
      ),
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: _tabs,
          ),
          if (_isProfileViewVisible) ...[
            // Profile Sidebar
            ProfileComponent(),
          ],
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.navBarBgColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
