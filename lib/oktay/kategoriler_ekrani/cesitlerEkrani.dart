import 'package:flutter/material.dart';
import 'package:mobilyst/oktay/kategoriler_ekrani/verilerRepository.dart';

import 'package:mobilyst/oktay/kategoriler_ekrani/yemekKategori.dart';
import 'package:mobilyst/oktay/yemek_ekrani/yemekEkrani.dart';

class CesitlerEkrani extends StatefulWidget {
  const CesitlerEkrani({super.key, required this.kategori});

  final YemekKategorisi kategori;

  @override
  State<CesitlerEkrani> createState() => _CesitlerEkraniState();
}

class _CesitlerEkraniState extends State<CesitlerEkrani> {
  List<YemekCesiti> newList = [];
  List<YemekCesiti> cesitler = [];
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    for (var i = 0; i < VerilerRepository().cesitler.length; i++) {
      if (VerilerRepository().cesitler[i].kategoriAdi ==
          widget.kategori.kategoriAdi) {
        cesitler.add(VerilerRepository().cesitler[i]);
      }
    }
    newList.addAll(cesitler);
  }

  void kategoriAra(String text) {
    if (text.isEmpty) {
      newList.clear();
      cesitler.forEach((element) {
        newList.add(element);
      });
      setState(() {});
      return;
    }
    newList.clear();
    for (var i = 0; i < cesitler.length; i++) {
      if (cesitler[i].cesitAdi.toLowerCase().contains(text.toLowerCase())) {
        newList.add(cesitler[i]);
      }
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    editingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_outlined,
                color: Colors.black,
              )),
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
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.kategori.kategoriAdi + " Kategorisi",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(newList[index].cesitAdi),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const MyYemekKategoriPage(),
                      ),
                    );
                  },
                );
              },
              itemCount: newList.length,
            ),
          ),
        ],
      ),
    );
  }
}
