import 'package:flutter/material.dart';
import 'package:qr_reader_fh/models/scan_model.dart';
import 'package:qr_reader_fh/providers/db_provider.dart';


class ScanListProvider extends ChangeNotifier{
  List<ScanModel?> scans = [];
  String tiposeleccionado = 'http';

  nuevoScan(String valor) async{
    final nuevoScan =  ScanModel(valor: valor);
    final id = await DBProvider.db.nuevoScan(nuevoScan);
    //Asignar el ID de la base de datos al modelo
    nuevoScan.id = id;

    if(tiposeleccionado == nuevoScan.tipo){
      this.scans.add(nuevoScan);
      notifyListeners();
    }

    cargarScan() async {
      final scans1 = await DBProvider.db.getTodosLosScans();
      this.scans = [...scans1];
      notifyListeners();
    }

    cargarScanPorTipo(String tipo) async{
      final scans = await DBProvider.db.getScansPorTipo(tipo);
      this.scans = [...scans];
      this.tiposeleccionado = tipo;
      notifyListeners();
    }

    borrarTodos() async{
      await DBProvider.db.deleteAllScan();
      this.scans = [];
      notifyListeners();
    }

    borrarScansPorId(int id) async{
      await DBProvider.db.deleteScan(id);
     cargarScanPorTipo(this.tiposeleccionado);
    }

  }
}