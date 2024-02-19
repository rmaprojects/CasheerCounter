import 'package:casheer_counter/data/source/local/model/product.dart';
import 'package:casheer_counter/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:realm/realm.dart';

final realmProvider = Provider<Realm>((ref) => throw UnimplementedError());

Future<void> main() async {
  final config = Configuration.local([Product.schema]);
  final realm = Realm(config);

  WidgetsFlutterBinding.ensureInitialized();

  runApp(ProviderScope(
    overrides: [realmProvider.overrideWithValue(realm)],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Casheer Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
        useMaterial3: true,
      ),
      routerConfig: Routes().router,
    );
  }
}
