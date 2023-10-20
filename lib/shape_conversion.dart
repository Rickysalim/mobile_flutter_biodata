import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const ShapeMain());
}

class ShapeMain extends StatelessWidget {
  const ShapeMain({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'PRAKTIKUM 2',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: HomePage(title: 'Shape Calculation'));
  }
}

class HomePage extends StatefulWidget {
  HomePage({required this.title});

  final String title;

  @override
  ShapeCalculation createState() => new ShapeCalculation();
}

class DrawerBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(child: Image.asset('assets/images/person.jpeg'));
  }
}

List<DropdownMenuItem<String>> get dropdownItems {
  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(child: Text("SILAKAN PILIH"), value: "SILAKAN PILIH"),
    DropdownMenuItem(child: Text("LUAS SEGITIGA"), value: "LUAS SEGITIGA"),
    DropdownMenuItem(
        child: Text("LUAS LAYANG-LAYANG"), value: "LUAS LAYANG-LAYANG"),
    DropdownMenuItem(child: Text("LUAS LINGKARAN"), value: "LUAS LINGKARAN"),
    DropdownMenuItem(
        child: Text("LUAS JAJAR GENJANG"), value: "LUAS JAJAR GENJANG"),
    DropdownMenuItem(
        child: Text("LUAS BELAH KETUPAT"), value: "LUAS BELAH KETUPAT"),
  ];
  return menuItems;
}

class ShapeCalculation extends State<HomePage> {
  String selectedValue = "SILAKAN PILIH";

  double _result = 0;

  double _input1 = 0;

  double _input2 = 0;

  void Select(select) {
    switch (select) {
      case "LUAS SEGITIGA":
        {
          _result = 0.5 * _input1 * _input2;
        }
      case "LUAS LAYANG-LAYANG":
        {
          _result = _input1 * _input2;
        }
      case "LUAS LINGKARAN":
        {
          _result = 3.14 * _input1 * _input1;
        }
      case "LUAS JAJAR GENJANG":
        {
          _result = _input1 * _input2;
        }
      case "LUAS BELAH KETUPAT":
        {
          _result = 0.5 * _input1 * _input2;
        }
      default:
        {
          _result = 0.0;
        }
        break;
    }
  }

  void luasSegitiga(a, t) {
    _result = 0.5 * a * t;
  }

  void kelilingSegitiga(k) {
    print(k);
    _result = k * k * k;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Konversi"),
          backgroundColor: Colors.lightBlue,
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerBody(),
              const Padding(
                padding: EdgeInsets.all(0.0),
                child: Column(children: [
                  Text('Nama: Ricky Salim'),
                  Text('Nim: 20210801300')
                ]),
              )
            ],
          ),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              Column(children: [
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Input Alas/Sisi 1/Radius',
                  ),
                  onChanged: (value) =>
                      {setState(() => _input1 = double.parse(value))},
                ),
                TextField(
                  decoration: const InputDecoration(
                    labelText: 'Input Tinggi/Sisi 2/Diameter',
                  ),
                  onChanged: (value) =>
                      {setState(() => _input2 = double.parse(value))},
                ),
              ]),
              Column(children: [
                DropdownButton(
                    value: selectedValue,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedValue = newValue!;
                        Select(newValue);
                      });
                    },
                    items: dropdownItems),
                Text('Hasil: $_result')
              ]),
            ])));
  }
}
