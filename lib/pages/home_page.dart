import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_fh/providers/db_provider.dart';
import 'package:qr_reader_fh/pages/direcciones_pages.dart';
import 'package:qr_reader_fh/pages/mapas_pages.dart';
import 'package:qr_reader_fh/widgets/custom_navigationbar.dart';
import 'package:qr_reader_fh/widgets/scan_buttom.dart';

import '../models/scan_model.dart';
import '../providers/ui_provider.dart';

class HomePage extends StatelessWidget{
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Historial'),
        actions: [
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.delete_forever)
          )
        ],
      ),
      body: _HomePageBody(),
      bottomNavigationBar: const CustomNavigationBar(),
      floatingActionButton: ScanButtom(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class _HomePageBody extends StatelessWidget {
  const _HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //obtener el selected menu opt
    final uiProvider = Provider.of<UiProvider>(context);

    // cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    //TODO: temporal leer base de datos
    //final tempScan = ScanModel(valor: 'http://google.com');
    //DBProvider.db.getScanById(3).then((scan) => print(scan?.valor));
     //DBProvider.db.getTodosLosScans().then(print);
    DBProvider.db.deleteAllScan().then(print);

    // final currentIndex = 0;

     switch(currentIndex){
        case 0:
          return const MapasPages();
        case 1:
          return const DireccionesPages();
        default:
          return const MapasPages();
     }
  }
}
