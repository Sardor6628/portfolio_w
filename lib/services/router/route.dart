import 'package:auto_route/auto_route.dart';
import 'package:sardordev_consulting/presentation/about_me_page.dart';
import 'package:sardordev_consulting/presentation/main_page_pages/main_page.dart';
import 'package:sardordev_consulting/presentation/blog_page.dart';

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
    AutoRoute(
      path: '/about',
      page: AboutMeRoute.page,
    ),
    AutoRoute(
      path: '/blog',
      page: BlogRoute.page,
    ),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        // optionally add root guards here
      ];
}
