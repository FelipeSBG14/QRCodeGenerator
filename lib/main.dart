import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrcode_app/screens/qrcode.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.white, // cor da barra superior
    statusBarIconBrightness: Brightness.dark, // ícones da barra superior
    systemNavigationBarColor: Colors.white, // cor da barra inferior
    systemNavigationBarIconBrightness:
        Brightness.dark, // ícones da barra inferior
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "~/",
      debugShowCheckedModeBanner: false,
      title: 'QRCodeReader',
      theme: ThemeData(primaryColor: Colors.white),
      home: QRCodeReader(),
    );
  }
}
