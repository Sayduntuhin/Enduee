import 'package:enduee/provider/cart_provider.dart';
import 'package:enduee/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cartprovider(),
        ),
      ],
      child: MaterialApp(
          title: 'Enduee',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              fontFamily: 'fonts1',
              colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.teal, primary: Colors.blue.shade100),
              appBarTheme: const AppBarTheme(
                  titleTextStyle: TextStyle(
                fontSize: 25,
                color: Colors.black,
              )),
              textTheme: const TextTheme(
                titleLarge: TextStyle(
                    fontFamily: 'fonts1',
                    fontSize: 25,
                    fontWeight: FontWeight.w700),
                titleMedium: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                bodySmall: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              useMaterial3: true),
          home: const Homepage()),
    );
  }
}
