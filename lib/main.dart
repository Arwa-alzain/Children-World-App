import 'package:educational_for_children/controller/favorite/favorite_controller.dart';
import 'package:educational_for_children/controller/setting/theme_controller.dart';
import 'package:educational_for_children/core/storage/shared_prefs.dart';
import 'package:educational_for_children/view/auth/login_view.dart';
import 'package:educational_for_children/view/first/first_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPrefs().init();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => ThemeCubit()),
          BlocProvider(create: (_) => FavoritesCubit()..loadFavorites()),
        ],
        child: MyApp(),
      ),
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeMode,
          home: SharedPrefs().getString("userEmail") == null
              ? const LoginView()
              : const FirstView(),
        );
      },
    );
  }
}
