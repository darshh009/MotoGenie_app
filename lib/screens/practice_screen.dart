import 'package:flutter/material.dart';


class ScrollAppBarExample extends StatefulWidget {
  @override
  _ScrollAppBarExampleState createState() => _ScrollAppBarExampleState();
}

class _ScrollAppBarExampleState extends State<ScrollAppBarExample> {
  ScrollController _scrollController = ScrollController();
  bool _isAppBarVisible = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.pixels > 50) {
      // Show AppBar when scrolled down
      if (!_isAppBarVisible) {
        setState(() {
          _isAppBarVisible = true;
        });
      }
    } else {
      // Hide AppBar when at the top
      if (_isAppBarVisible) {
        setState(() {
          _isAppBarVisible = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            top: _isAppBarVisible ? 0 : -60, // Initially hidden
            left: 0,
            right: 0,
            child: AppBar(
              title: Text("Scroll AppBar"),
              backgroundColor: Colors.blue,
            ),
          ),
        ],
      ),
    );
  }
}
