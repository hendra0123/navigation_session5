import 'package:flutter/material.dart';
import 'first_screen.dart';
import 'second_screen.dart';
import 'third_screen.dart';
import 'fourth_screen.dart';
import 'dynamic_screen.dart';
import 'dynamicDetail_screen.dart';
import 'unknown_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Codelab',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second_screen': (context) => SecondScreen(),
        '/third_screen': (context) => ThirdScreen(),
        '/fourth_screen': (context) => FourthScreen(),
        '/dynamic_screen': (context) => DynamicScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name?.startsWith('/dynamic_screen/') ?? false) {
          final itemId = int.tryParse(settings.name!.split('/').last);
          if (itemId != null) {
            return MaterialPageRoute(
              builder: (context) => DynamicDetailScreen(itemId),
              settings: settings,
            );
          }
        }
        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => UnknownScreen(),
          settings: settings,
        );
      },
    );
  }
}
