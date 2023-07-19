import 'package:ava_project/routes.dart';
import 'package:ava_project/utils/services/sqlite_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:riverpod/riverpod.dart';

final appProvider = StateProvider((ref) => 0);

void main() {
  final getIt = GetIt.instance;
  getIt.registerSingleton<SQLiteService>(SQLiteService());

  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: appRoutes,
    );
  }
}
