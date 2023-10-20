import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetPractice());
}

class WidgetPractice extends StatelessWidget {
  const WidgetPractice({super.key});

  // This widget is the root of your application.
  @override
  Calculation createState() => new Calculation();
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
        home: HomePageCal(title: 'Test'));
  }
}

class HomePageCal extends StatefulWidget {
  HomePageCal({required this.title});

  final String title;

  @override
  Calculation createState() => new Calculation();
}

class DrawerBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DrawerHeader(child: Image.asset('assets/images/person.jpeg'));
  }
}

class Calculation extends State<HomePageCal> {
  int _kilogram = 0;

  int _angka1 = 0;

  int _angka2 = 0;

  int _hasil = 0;

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
              Padding(
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
            TextField(
              decoration: InputDecoration(
                labelText: 'gram',
              ),
              onChanged: (value) {
                setState(() {
                  _kilogram = int.parse(value) ~/ 1000;
                });
              },
            ),
            Text('$_kilogram kg'),
            TextField(
              decoration: InputDecoration(
                labelText: 'Angka 1',
              ),
              onChanged: (value) {
                setState(() {
                  _angka1 = int.parse(value);
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Angka 2',
              ),
              onChanged: (value) {
                setState(() {
                  _angka2 = int.parse(value);
                });
              },
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _hasil = _angka1 + _angka2;
                });
              },
              child: const Text('+'),
            ),
             ElevatedButton(
              onPressed: () {
                setState(() {
                  _hasil = _angka1 * _angka2;
                });
              },
              child: const Text('*'),
            ),
               ElevatedButton(
              onPressed: () {
                setState(() {
                  _hasil = _angka1 ~/ _angka2;
                });
              },
              child: const Text('/'),
            ),
            Text('Hasil = $_hasil'),
          ],
        )));
  }
}
