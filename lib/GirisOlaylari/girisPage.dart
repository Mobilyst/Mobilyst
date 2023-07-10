import 'package:flutter/material.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'package:mobilyst/GirisOlaylari/tabs/firstSignIn.dart';
import 'package:mobilyst/GirisOlaylari/tabs/secondSignUp.dart';

class GirisPage extends StatefulWidget {
  final String detailsPath;
  const GirisPage({super.key, required this.detailsPath});

  @override
  State<GirisPage> createState() => _GirisPageState();
}

class _GirisPageState extends State<GirisPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Hesabım",
            style: TextStyle(
              color: AppColors.bir,
            ),
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: AppColors.uc,
        ),
        body: Column(children: [
          //hata olursa buraya bak const ekledin
          TabBar(
              controller: _tabController,
              labelColor: AppColors.yedi, //secili olan tabin rengi
              unselectedLabelColor: AppColors.iki,// secili olmayan tabin rengi
              indicatorColor: AppColors.alti, // secili cizgi
              tabs: const [
                Tab(
                  text: 'Giriş Yap',
                  
                ),
                Tab(
                  text: 'Üye Ol',
                ),
              ]),
          Expanded(
            child: TabBarView(controller: _tabController, children: [
              //sign in
              SignInPage(
                tabController: _tabController,
              ),

              //sign up
              SignUpPage(tabController: _tabController),
            ]),
          )
        ]),
      ),
    );
  }
}
