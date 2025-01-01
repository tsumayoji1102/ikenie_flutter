import 'package:go_router/go_router.dart';
import 'package:ikenie_flutter/main.dart';
import 'package:ikenie_flutter/ui/pages/photos_page.dart';

final routerConfig = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const MyHomePage(),
        routes: [
          GoRoute(
            name: Routes.photos_page.name,
            path: Routes.photos_page.name,
            builder: (context, state) => PhotosPage(),
          ),
        ]),
  ],
);

enum Routes {
  photos_page;
}
