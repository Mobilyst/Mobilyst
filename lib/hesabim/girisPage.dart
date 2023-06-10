import 'package:flutter/material.dart';
import 'package:mobilyst/hesabim/tabs/firstSignIn.dart';
import 'package:mobilyst/hesabim/tabs/secondSignUp.dart';

class GirisPage extends StatelessWidget {
  const GirisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Hesabım',
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
          backgroundColor: Colors.black12,
        ),
        body: Column(children: const [
          //hata olursa buraya bak const ekledin
          TabBar(
              labelColor: Colors.black, //secili olan tabin rengi
              unselectedLabelColor: Colors.grey, // secili olmayan tabin rengi
              tabs: [
                Tab(
                  text: 'Giriş Yap',
                ),
                Tab(
                  text: 'Üye Ol',
                ),
              ]),
          Expanded(
            child: TabBarView(children: [
              //sign in
              SignInPage(),

              //sign up
              SignUpPage(),
            ]),
          )
        ]),
      ),
    );
  }
}
