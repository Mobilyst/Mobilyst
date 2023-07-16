import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilyst/oktay/kategoriler_ekrani/verilerRepository.dart';

import 'package:mobilyst/oktay/kategoriler_ekrani/yemekKategori.dart';
import 'package:mobilyst/oktay/yemek_ekrani/yemekEkrani.dart';

import '../../ColorAndType/color.dart';

class CesitlerEkrani extends ConsumerStatefulWidget {
  const CesitlerEkrani({super.key, required this.kategori});

  final YemekKategorisi kategori;

  @override
  ConsumerState<CesitlerEkrani> createState() => _CesitlerEkraniState();
}

class _CesitlerEkraniState extends ConsumerState<CesitlerEkrani> {
  List<YemekCesiti> newList = [];
  List<YemekCesiti> cesitler = [];
  TextEditingController editingController = TextEditingController();

  @override
  void initState() {
    super.initState();

    setState(() {

      newList.addAll(cesitler);
    });
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
    //final verilerRepository = ref.watch(verilerRepositoryProvider);
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

          titleSpacing:0 ,

          title: SizedBox(
            height: 60,
            child: Padding(
              padding: const EdgeInsets.only(right: 10,top: 8),
              child: TextField(
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
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                if(newList.isEmpty){
                  return const Center(child: Text("Burada Çeşit bulunamadı"),) ;
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      title: Text(newList[index].cesitAdi),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => MyYemekKategoriPage(kategoriAdi: widget.kategori.kategoriAdi),
                          ),
                        );
                      },
                    ),
                    Divider(
                      thickness: 2,
                    )
                  ],
                );
              },
              itemCount: newList.length==0?1:newList.length,
            ),
          ),
        ],
      ),
    );
  }
}
