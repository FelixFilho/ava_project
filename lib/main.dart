import 'package:ava_project/core/cubit/session_cubit/session_cubit.dart';
import 'package:ava_project/core/cubit/session_cubit/session_state.dart';
import 'package:ava_project/routes.dart';
import 'package:ava_project/utils/services/sqlite_database.dart';
import 'package:ava_project/view/address/address_screen.dart';
import 'package:ava_project/view/login/login_screen.dart';
import 'package:ava_project/view/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';

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

  Widget validateSession(SessionState state) {
    if (state is SessionStateLoggedIn) {
      return const AddressScreen();
    }

    return const LoginScreen();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SessionCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: appRoutes,
      ),
    );
  }
}
