import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nagola/Help/AppColor.dart';

import '../Screen/AccountScreen.dart';
import '../Screen/ActivityScreen.dart';
import '../Screen/HomeScreen.dart';
import '../Screen/OffersScreen.dart';
import '../Screen/ServicesScreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const ServicesScreen(),
    const OffersScreen(),
    const ActivityScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness: Brightness.dark,
    ));
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;

    final iconSize = w * 0.062;
    final activeIconSize = w * 0.073;
    final textSize = w * 0.028;

    return Scaffold(
      backgroundColor: AppColor.second, // stable bottom bar
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),

      bottomNavigationBar: Container(
        color: AppColor.primary,
        child: SafeArea(
          child: ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 14, sigmaY: 14),
              child: Container(
                height: 70, // stable height
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color(0xFF1D3557).withOpacity(0.90), // navy top
                      const Color(0xFF457B9D).withOpacity(0.90), // blue bottom
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  border: Border(
                    top: BorderSide(
                        color: Colors.white.withOpacity(0.24), width: 1),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.35),
                      blurRadius: 24,
                      offset: const Offset(0, -4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildNavItem(0, Icons.home, "Home", iconSize, activeIconSize, textSize),
                    _buildNavItem(1, Icons.apps, "Services", iconSize, activeIconSize, textSize),
                    _buildNavItem(2, Icons.local_offer, "Offers", iconSize, activeIconSize, textSize),
                    _buildNavItem(3, Icons.receipt_long, "Activity", iconSize, activeIconSize, textSize),
                    _buildNavItem(4, Icons.person, "Account", iconSize, activeIconSize, textSize),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      int index,
      IconData icon,
      String label,
      double iconSize,
      double activeIconSize,
      double textSize) {
    final selected = _currentIndex == index;

    return Expanded(
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        onTap: () => setState(() => _currentIndex = index),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: selected ? activeIconSize : iconSize,
              color: selected
                  ? const Color(0xFF00E0FF)
                  : Colors.white.withOpacity(0.65),
            ),
            SizedBox(height: 3),
            FittedBox(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: textSize,
                  fontWeight: selected ? FontWeight.bold : FontWeight.w500,
                  color: selected
                      ? const Color(0xFF00E0FF)
                      : Colors.white.withOpacity(0.65),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
