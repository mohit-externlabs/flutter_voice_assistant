import 'package:flutter/material.dart';
import 'package:flutter_voice_assistant/providers/cart_provider.dart';
import 'package:flutter_voice_assistant/screens/home.dart';
import 'package:flutter_voice_assistant/screens/pizza.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => Cart())],
      child: const MyApp(),
    ),
  );
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Voice Assistant Demo'),
        '/second': ((context) => const PizzaScreen()),
      },
      navigatorObservers: [routeObserver],
    );
  }
}
