import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:website_p/presentation/about_me_page.dart';
import 'package:website_p/presentation/main_page.dart';

part 'route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType =>
      RouteType.material(); //.cupertino, .adaptive ..etc

  @override
  List<AutoRoute> get routes => [
        // HomeScreen is generated as HomeRoute because
        // of the replaceInRouteName property
        AutoRoute(page: MainDisplayRoute.page, initial: true),
        AutoRoute(page: AboutMeRoute.page),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
