import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:mpj_vendor/screens/add_items.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
        // showElevation: true,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: const Text('Orders'),
            icon: const Icon(Icons.monetization_on),
            activeColor: Colors.pink.shade300,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: const Text('Collections'),
            icon: const Icon(Icons.collections),
            activeColor: Colors.purple.shade300,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: const Text('Ledger'),
            icon: const Icon(Icons.library_books_sharp),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            title: const Text('Settings'),
            icon: const Icon(Icons.settings),
            textAlign: TextAlign.center,
            activeColor: Colors.black54,
          ),
        ],
      ),
      appBar: NewGradientAppBar(
        gradient: LinearGradient(colors: [
          Colors.purple.shade400,
          Colors.pink.shade300,
          // Colors.purple.shade200
        ]),
        title: const Text('Vendor Management'),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(
              color: Colors.purple.shade100,
            ),
            // Container(
            //   color: Colors.pink.shade300,
            // ),
            const JewelleryItems(),
            Container(
              color: Colors.green[100],
            ),
            Container(
              color: Colors.blue[100],
            ),
          ],
        ),
      ),
    );
  }
}
