import 'package:flutter/material.dart';
import 'package:vize_final/screens/not_hesapla.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vize Final Hesapla"),
      ),
      body: NotHesapla(),
    );
  }
}
