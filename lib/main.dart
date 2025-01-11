import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:website_p/bl/animated_text/animated_text_cubit.dart';
import 'package:website_p/bl/theme/theme_cubit.dart';
import 'package:website_p/services/router/route.dart';
import 'package:website_p/services/storage/theme_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  ThemeMode savedThemeMode;
  try {
    savedThemeMode = await ThemeStorage.getSavedThemeMode();
  } catch (e) {
    savedThemeMode = ThemeMode.system; // Fallback if loading fails
    debugPrint('Error loading theme mode: $e');
  }

  final _appRouter = AppRouter();
  runApp(MyApp(savedThemeMode: savedThemeMode, appRouter: _appRouter));
}

class MyApp extends StatelessWidget {
  final ThemeMode savedThemeMode;
  final AppRouter appRouter;

  const MyApp({
    Key? key,
    required this.savedThemeMode,
    required this.appRouter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeCubit(savedThemeMode),
        ),
        BlocProvider(
          create: (context) => TypeWriterCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            theme: ThemeData(useMaterial3: true),
            darkTheme: ThemeData(
              useMaterial3: true,
              brightness: Brightness.dark,
            ),
            themeMode: themeMode,
          );
        },
      ),
    );
  }
}