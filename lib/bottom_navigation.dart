import 'package:flutter/material.dart';
import 'package:motogenie_app/screens/practice_screen.dart';
import 'package:motogenie_app/screens/premium_page.dart';
import 'package:motogenie_app/screens/profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    PremiumScreen(),
    ProfileScreen(),
    PremiumScreen(),
    ProfileScreen()
    // Add other screens here
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],

      bottomNavigationBar: Stack(
        children: [BottomNavigationBar(
          backgroundColor: const Color(0xffe6ecf4),
          currentIndex: _selectedIndex,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          iconSize: 24,
          enableFeedback: false,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.blueGrey,

          items: [
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.home, 0),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: _buildIcon(Icons.shopping_cart_checkout_outlined, 1),
              label: "Orders",
            ),
            BottomNavigationBarItem(
              icon: _buildEliteIcon(2),
              label: "Elite",
            ),
            BottomNavigationBarItem(
              icon: _buildProfileIcon(4,_selectedIndex),
              label: "Profile",
            ),

          ],
        ),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            top: 0,
            left: MediaQuery.of(context).size.width / 3.9* _selectedIndex,
            child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              curve: Curves.easeInOut,// Smooth transition effect
              width: MediaQuery.of(context).size.width / 5.2, // Equal width for each item
              height: 1, // Thin top indicator
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(
                  color: Colors.black.withAlpha(100),
                  blurRadius: 2,
                  spreadRadius: 0.5,
                  offset: Offset(0, -1),

                )],
                border: Border(
                  top: BorderSide(
                    color: Colors.red, // Replace with any effect (shadow, gradient, etc.)
                    width: 2, // Thickness of the indicator
                  ),
                ),
              ),
            ),
          ),
    ]
      ),
    );
  }

  /// Builds standard icon with top indicator
  Widget _buildIcon(IconData icon, int index, {Color? color}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 32,
          height: 32,
          child: Icon(icon, color: color ?? (_selectedIndex == index ? Colors.red : Colors.blueGrey)),
        ),
      ],
    );
  }

  /// Builds the "Elite" image icon with top indicator
Widget _buildEliteIcon(int index) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 32,
          height: 32,
          child: Image.asset("assets/images/pre_icon.png", fit: BoxFit.contain),
        ),
      ],
    );
  }
}

Widget _buildProfileIcon(int index,int _selectedIndex) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      SizedBox(
        width: 32,
        height: 32,
        child: CircleAvatar(
            backgroundColor:_selectedIndex==index? Colors.red.shade300:Colors.blueGrey.shade200,

            child: Image.asset("assets/images/profile.png", fit: BoxFit.contain,)),
      ),
    ],
  );
}


