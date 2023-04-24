import 'package:favourite_app/Provider/theme_provider.dart';
import 'package:flutter/material.dart';

import 'Provider/selected_provider.dart';
import 'Screen/dark_theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SelectedItems()),
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: Builder(builder: (BuildContext context) {
          final themeChanger = Provider.of<ThemeProvider>(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: themeChanger.thememode,
            theme: ThemeData(
              primarySwatch: Colors.amber,
              brightness: Brightness.light,
            ),
            darkTheme: ThemeData(
                brightness: Brightness.dark,
                iconTheme: const IconThemeData(color: Colors.pink),
                appBarTheme: const AppBarTheme(color: Colors.teal)),
            home: const DarkThemeScreen(),
          );
        }));
  }
}
