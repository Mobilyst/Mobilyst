import 'package:flutter/material.dart';
import 'package:mobilyst/ColorAndType/color.dart';
import 'package:mobilyst/oktay/kategoriler_ekrani/cesitlerEkrani.dart';
import 'package:mobilyst/oktay/kategoriler_ekrani/verilerRepository.dart';
import 'package:mobilyst/oktay/kategoriler_ekrani/yemekKategori.dart';

class YemekKategorileriSayfasi extends StatefulWidget {
  final String detailsPath;

  const YemekKategorileriSayfasi({Key? key, required this.detailsPath})
      : super(key: key);

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
            child: Column(
              children: [ const SizedBox(height: 6,),
                TextField(
                  onChanged: (text) {
                    kategoriAra(text);
                  },
                  controller: editingController,
                  decoration: InputDecoration(
                    hintText: 'Ara...',
                    suffixIcon: IconButton(
                      color: AppColors.yedi,
                      onPressed: () => setState(() {
                        editingController.clear();

                      }),
                      icon: const Icon(Icons.clear),
                    ),
                    prefixIcon: IconButton(
                      icon: const Icon(
                        Icons.search,
                        color: AppColors.yedi,
                      ),
                      onPressed: () {

                        // Perform the search here
                      },
                    ),
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color: Colors.grey, // Normal durumda kenar çizgi rengi
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      borderSide: BorderSide(
                        color:
                            Colors.grey, // Tiklandiktan sonra kenar çizgi rengi
                        width: 2.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal:
                        15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Yemek Kategorileri',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
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
