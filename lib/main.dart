import 'package:flutter/material.dart';
import 'package:mvvm/app/view/app_provider.dart';
import 'package:mvvm/app/view/myapp.dart';
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => UserViewModel()),
//       ],
//       child: MaterialApp(
//         title: 'Flutter MVVM',
//         theme: ThemeData(
//           primarySwatch: Colors.blue,
//         ),
//         home: const UserPage(),
//       ),
//     );
//   }
// }

Future<void> main() async {
  runApp(const AppProviders(child: MyApp()));
}
