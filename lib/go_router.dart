part of 'routers_go.dart';

var routers_go = GoRouter(
  routes: <RouteBase> [
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
      return const HomeScreen();
      },
      ),
  ]);