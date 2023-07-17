import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'package:mobilyst/GirisOlaylari/girisPage.dart';
import 'package:mobilyst/Hesabim/HesapBilgileri/favoriListelerimPage.dart';
import 'package:mobilyst/Hesabim/HesapBilgileri/hesapBilgilerimPage.dart';

class HesabimPage extends StatefulWidget {
  const HesabimPage({Key? key}) : super(key: key);

  @override
  State<HesabimPage> createState() => _HesabimPageState();
}

class _HesabimPageState extends State<HesabimPage> {
// giris yapan kullanici emaili
  final user = FirebaseAuth.instance.currentUser!;

// kullanici cikis yapma methodu
  @override
  Future<void> signUserOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => GirisPage(
                  detailsPath: '',
                )),
      );
    } catch (error) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Hata'),
          content: Text('Çıkış işlemi başarısız.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SafeArea(
        child: ListView(children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.account_circle_sharp,
                  size: 100,
                  color: Colors.grey,
                ),
                Text(user.email!),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 19),
            child: Divider(
              height: 5,
              thickness: 1,
              color: Colors.grey.shade300,
            ),
          ),
          ListTile(
            title: Text('Favori Listelerim'),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.favorite_border),
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => FavorilerSayfasi()),
              );
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 19),
            child: Divider(
              height: 5,
              thickness: 1,
              color: Colors.grey.shade300,
            ),
          ),
          ListTile(
            title: Text('Hesap Bilgilerim'),
            trailing: Icon(Icons.arrow_forward_ios),
            leading: Icon(Icons.account_circle_outlined),
            contentPadding: EdgeInsets.all(10),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HesapBilgileriPage()),
              );
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 19),
            child: Divider(
              height: 5,
              thickness: 1,
              color: Colors.grey.shade300,
            ),
          ),
          SizedBox(
            height: 180,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap:
                      signUserOut, //?? cıkıs yaptıgında sıgn ın sayfasına donmelı
                  child: const Text(
                    ' Çıkış Yap',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
