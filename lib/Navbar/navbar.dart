import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:split_easy/Constants/colors.dart';
import 'package:split_easy/Screens/Friends/friend_list.dart';
import 'package:split_easy/Screens/Profile/profile_component.dart';
import 'package:split_easy/Screens/Share/share_list.dart';
import 'package:split_easy/Screens/Split/split.dart';

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  bool _isProfileViewVisible =
      false; // State to control profile view visibility

  final List<Widget> _tabs = [SplitPage(), FriendList()];

  // Defining Particles for animation.
  ParticleOptions particles = ParticleOptions(
    baseColor: AppColors.colorFirst,
    spawnOpacity: 0.0,
    opacityChangeRate: 0.25,
    minOpacity: 0.1,
    maxOpacity: 0.4,
    particleCount: 250,
    spawnMaxRadius: 7.0,
    spawnMaxSpeed: 11.0,
    spawnMinSpeed: 10,
    spawnMinRadius: 1.0,
  );

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
      backgroundColor: AppColors.colorFourth,
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
                    "Splits",
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
                    backgroundColor: AppColors.colorFirst,
                    child: const Icon(Icons.person),
                  ),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: AppColors.colorSecond,
      ),
      body: AnimatedBackground(
        vsync: this,
        behaviour: RandomParticleBehaviour(options: particles),
        child: Stack(
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
            Align(
              alignment: Alignment.bottomRight,
              child: Container(
                color: AppColors.colorThird.withOpacity(0.4),
                width: MediaQuery.of(context).size.width * 0.5,
                child: Center(
                  child: ShareList(),
                ),
              ),
            ),
            if (_isProfileViewVisible) ...[
              // Profile Sidebar
              ProfileComponent(),
            ],
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppColors.colorSecond,
        child: const Icon(Icons.add),
      ),
    );
  }
}
