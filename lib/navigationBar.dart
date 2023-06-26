import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:mobilyst/Anasayfa/AnaSayfa.dart';
import 'package:mobilyst/GirisOlaylari/girisPage.dart';
import 'package:mobilyst/haritaPage.dart';
import 'package:mobilyst/Hesabim/hesabimPage.dart';

import 'food_comparison_screen/food_comparison_screen.dart';
import 'oktay/kategoriler_ekrani/kategorilerSayfasi.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({Key? key}) : super(key: key);

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  //deneme

  @override
  void dispose() {
    FirebaseAuth.instance.authStateChanges().listen((user) {}).cancel();
    super.dispose();
  }

  int _currentIndex = 0;

  final List<Widget> _pages = [
    AnaSayfa(),
    //HesabimPage(), // inceleme icin buraya yazildi
    YemekKategorileriSayfasi(),
    HaritaPage(),
    GirisPage(),
  ];

  void _onTabChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
            ],
          ),
        ),
      ),
    );
  }
}
