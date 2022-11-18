import 'package:flutter/material.dart';
import './views/previewPic.dart';

void main() {
  runApp(const Imagem());
}

class Imagem extends StatelessWidget {
  const Imagem({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        backgroundColor: const Color.fromRGBO(0, 194, 145, 76),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        elevatedButtonTheme: const ElevatedButtonThemeData(),
      ),
    );
  }
}
