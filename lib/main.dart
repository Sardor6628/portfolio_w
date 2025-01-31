import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sardordev_consulting/bl/main/main_page_cubit.dart';
import 'package:sardordev_consulting/bl/theme/theme_cubit.dart';
import 'package:sardordev_consulting/services/router/route.dart';
import 'package:sardordev_consulting/services/storage/theme_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  ThemeMode savedThemeMode;
  try {
    savedThemeMode = await ThemeStorage.getSavedThemeMode();
  } catch (e) {
    savedThemeMode = ThemeMode.system; // Fallback if loading fails
    debugPrint('Error loading theme mode: $e');
  }

  final _appRouter = AppRouter();
  runApp(EasyLocalization(
    supportedLocales: const [
      Locale('en'),
      Locale('ko'),
      Locale('ru'),
    ],
    path: 'assets/translation', // Path to your JSON translation files
    fallbackLocale: const Locale('en'),
    child: MyApp(savedThemeMode: savedThemeMode, appRouter: _appRouter),
  ));}

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
          create: (context) => MainPageCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, themeMode) {
          return MaterialApp.router(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routerDelegate: appRouter.delegate(),
            routeInformationParser: appRouter.defaultRouteParser(),
            theme: ThemeData(
              useMaterial3: true,
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: const Color(0xff272c35),
              brightness: Brightness.dark,
            ),
            themeMode: themeMode,
          );
        },
      ),
    );
  }
}
