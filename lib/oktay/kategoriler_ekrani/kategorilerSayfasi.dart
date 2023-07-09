import 'package:flutter/material.dart';
import 'package:mobilyst/oktay/kategoriler_ekrani/cesitlerEkrani.dart';
import 'package:mobilyst/oktay/kategoriler_ekrani/verilerRepository.dart';
import 'package:mobilyst/oktay/kategoriler_ekrani/yemekKategori.dart';

class YemekKategorileriSayfasi extends StatefulWidget {
  final String detailsPath;
  const YemekKategorileriSayfasi({Key? key, required this.detailsPath}) : super(key: key);

  @override
  _YemekKategorileriSayfasiState createState() =>
      _YemekKategorileriSayfasiState();
}

class _YemekKategorileriSayfasiState extends State<YemekKategorileriSayfasi> {
  TextEditingController editingController = TextEditingController();

  List<YemekKategorisi> newList = [];

  @override
  void initState() {
    super.initState();
    newList.addAll(VerilerRepository().kategoriler);
  }

  @override
  void dispose() {
    super.dispose();
    editingController.dispose();
  }

  void kategoriAra(String text) {
    if (text.isEmpty) {
      newList.clear();
      VerilerRepository().kategoriler.forEach((element) {
        newList.add(element);
      });
      setState(() {});
      return;
    }
    newList.clear();
    for (var i = 0; i < VerilerRepository().kategoriler.length; i++) {
      if (VerilerRepository()
          .kategoriler[i]
          .kategoriAdi
          .toLowerCase()
          .contains(text.toLowerCase())) {
        newList.add(VerilerRepository().kategoriler[i]);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          title: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (text) {
                  kategoriAra(text);
                },
                controller: editingController,
                decoration: const InputDecoration(
                  labelText: '',
                  suffixIcon: Icon(
                    Icons.search,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Yemek Kategorileri',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Column(
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.all(8),
                    title: Text(newList[index].kategoriAdi),
                    trailing: const Icon(Icons.arrow_forward_ios),
                    leading: Image.network(
                      newList[index].kategoriResimUrl,
                      width: 60,
                      height: 60,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CesitlerEkrani(
                            kategori: newList[index],
                          ),
                        ),
                      );
                    },
                  ),
                  const Divider(
                    thickness: 2,
                  ),
                ],
              ),
              itemCount: newList.length,
            ),
          ),
        ],
      ),
    );
  }
}
