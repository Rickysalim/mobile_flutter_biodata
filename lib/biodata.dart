import 'package:flutter/material.dart';

// class BiodataBody extends Column {
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container(
//               width: 110.0,
//               height: 100.0,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20.0)
//               ),
//               child: FlutterLogo(
//                 size: 100.0,
//               ),
//             ),
//             SizedBox(width: 30.0),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: <Widget> [
//                 Text('I Called a'),
//                 Text('Flutter Logo Widget')
//                 ]
//             ),
//           ],
//         ),
//         Biodata(title: 'Biodata')
//       ],
//     );
//   }
// }

class Biodata extends StatelessWidget {
  const Biodata({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(title),
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget> [
        // Image.asset('assets/images/person.jpeg'),
        Container(
          width:100,
          height: 100,
          child: Image.asset('assets/images/person.jpeg'),
        ),
        const Text('Nama: Ricky Salim'),
        const Text('Nim: 20210801300'),
        const Text('Pendidikan: S1 Teknik Informatika'),
        const Text('Pekerjaan: -'),

        // ElevatedButton(
        //   onPressed: () {},
        //   child: const Text('Click Me'),
        // )
      ],
    )
    )
    );
  }
}
