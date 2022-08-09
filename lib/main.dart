import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader_fh/pages/home_page.dart';
import 'package:qr_reader_fh/pages/mapa_page.dart';
import 'package:qr_reader_fh/providers/scan_list_provider.dart';
import 'package:qr_reader_fh/providers/ui_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UiProvider()),
        ChangeNotifierProvider(create: (_) => ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
       title: 'QR Reader',
        initialRoute: 'home',
        routes: {
         'home':  (_) => const HomePage(),
          'mapa': (_) => const MapaPage()
        },
        theme: ThemeData(
          //TODO: Tema principal
            colorScheme: ColorScheme.fromSwatch(
              primarySwatch: Colors.orange,
            ),
          floatingActionButtonTheme: const FloatingActionButtonThemeData(
            backgroundColor: Colors.orangeAccent
          ),

        ),
      ),
    );
  }
}
