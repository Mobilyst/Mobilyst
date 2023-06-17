import 'package:flutter/material.dart';
import 'package:mobilyst/Hesabim/HesapBilgileri/kullaniciBilgileriPage.dart';
import 'package:mobilyst/Hesabim/HesapBilgileri/sifreDegisikligiPage.dart';

class HesapBilgileriPage extends StatelessWidget {
  const HesapBilgileriPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Hesap Bilgilerim',
          textAlign: TextAlign.center,
        ),
        centerTitle: true,
        backgroundColor: Colors.black12,
      ),
      body: SafeArea(
          child: ListView(
        children: [
          ListTile(
            title: Text('Kullanıcı Bilgilerim'),
            trailing: Icon(Icons.arrow_forward_ios),
            contentPadding: EdgeInsets.all(15),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => KullaniciBilgileriPage()),
              );
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              height: 5,
              thickness: 1,
              color: Colors.grey.shade300,
            ),
          ),
          ListTile(
            title: Text('Şifre Değişikliği'),
            trailing: Icon(Icons.arrow_forward_ios),
            contentPadding: EdgeInsets.all(15),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SifreDegisikligiPage()),
              );
            },
          ),
        ],
      )),
    );
  }
}
