import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mobilyst/girisPage.dart';
import 'package:mobilyst/haritaPage.dart';
import 'package:mobilyst/homePage.dart';
import 'package:mobilyst/kategoriPage.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  //deneme
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomePage(),
    KategoriPage(),
    HaritaPage(),
    GirisPage(),
  ];

  void _onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  //deneme
//PageController controller = PageController(); // deneme

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
          child: GNav(
              gap: 10,
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey.shade800,
              padding: EdgeInsets.all(20),
              selectedIndex: _currentIndex,
              onTabChange: _onTabChanged,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Anasayfa',
                ),
                GButton(
                  icon: LineIcons.list,
                  text: 'Kategoriler',
                ),
                GButton(
                  icon: Icons.place,
                  text: 'Harita',
                ),
                GButton(
                  icon: LineIcons.user,
                  text: 'Hesabım',
                ),
              ]),
        ),
      ),
    );
  }
}
