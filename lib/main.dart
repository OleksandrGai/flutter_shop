import 'package:flutter/material.dart';
import 'package:flutter_shop_app/screenc/home_screen_directory/home_screen.dart';
import 'package:flutter_shop_app/theme/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(isDarkTheme: false),
      child: const HomeScreen()));
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Consumer<ThemeProvider>(
//       builder: (context, value, child) {
//         return MaterialApp(
//           theme: value.getTheme,
//           home: SafeArea(
//             child: Scaffold(
//               body: Center(
//                 child: TextButton(
//                   child: const Text('tab'),
//                   onPressed: () {
//                     value.swapTheme();
//                   },
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
