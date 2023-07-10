import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobilyst/ozge/karsilastirma_ekrani/magazaRepository.dart';

class StorePage extends ConsumerStatefulWidget {
  final String storeName;

  const StorePage(this.storeName, {Key? key}) : super(key: key);

  @override
  ConsumerState<StorePage> createState() => _StorePageState();
}

class _StorePageState extends ConsumerState<StorePage> {
  List<String> storeNames = [];
  Map<String, double> storePrices = {};

  @override
  void initState() {
    super.initState();
    setState(() {
      storeNames=ref.read(magazaRepositoryProvider).getStoreNAmes();
      storePrices = ref.read(magazaRepositoryProvider).getStorePricdes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.storeName),
      ),
      body: Center(
        child: Text('Bu sayfa ${widget.storeName} mağazasını temsil ediyor.'),
      ),
    );
  }
}




