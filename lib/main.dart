import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/auth_provider.dart';
import 'package:flutter_application_1/providers/fudbaler_provider.dart';
import 'package:flutter_application_1/providers/klub_provider.dart';
import 'package:flutter_application_1/providers/korisnik_provider.dart';
import 'package:flutter_application_1/providers/liga_provider.dart';
import 'package:flutter_application_1/providers/match_provider.dart';
import 'package:flutter_application_1/providers/sezona_provider.dart';
import 'package:flutter_application_1/route_generator.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => AuthProvider()),
      ChangeNotifierProvider(create: (_) => LigaProvider()),
      ChangeNotifierProvider(create: (_) => MatchProvider()),
      ChangeNotifierProvider(create: (_) => KlubProvider()),
      ChangeNotifierProvider(create: (_) => SezonaProvider()),
      ChangeNotifierProvider(create: (_) => FudbalerProvider()),
      ChangeNotifierProvider(create: (_) => KorisnikProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
