import 'package:flutter/material.dart';

// Firebase
import 'package:firebase_core/firebase_core.dart';
import 'package:to_do/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Get It
import 'package:get_it/get_it.dart';

// Repositories
import 'package:to_do/repositories/authentication_repository.dart';
import 'package:to_do/repositories/todo_repository.dart';

// Routes
import 'package:to_do/routes/routes.dart';

// Screens
import 'package:to_do/screens/splash/splash.dart';

// Blocs
import 'blocs/todo_cubit.dart';
import 'package:to_do/blocs/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

GetIt getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  setupLocator();
  runApp(const MyApp());
}

void setupLocator() {
  GetIt.I
      .registerLazySingleton<FirebaseAuthService>(() => FirebaseAuthService());
  GetIt.I.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository(GetIt.I<FirebaseAuthService>()));
  GetIt.I.registerLazySingleton<TodoRepository>(() => TodoRepository());
  GetIt.I.registerFactory<AuthCubit>(
      () => AuthCubit(GetIt.I<FirebaseAuthService>()));
  GetIt.I
      .registerFactory<TodoCubit>(() => TodoCubit(GetIt.I<TodoRepository>()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(GetIt.I<FirebaseAuthService>()),
      child: MaterialApp(
        title: 'Flutter To Do',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRoutes.generateRoute,
        home: const Splash(),
      ),
    );
  }
}
