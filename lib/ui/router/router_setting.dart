import 'package:go_router/go_router.dart';
import 'package:ikenie_flutter/main.dart';
import 'package:ikenie_flutter/ui/pages/nested_scroll_view_page.dart';
import 'package:ikenie_flutter/ui/pages/photo_list_page.dart';
import 'package:ikenie_flutter/ui/pages/photos_page.dart';
import 'package:ikenie_flutter/ui/pages/claude_list_page.dart';

final routerConfig = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const MyHomePage(),
        routes: [
          GoRoute(
            name: Routes.draw_page.name,
            path: Routes.draw_page.name,
            builder: (context, state) => DrawPage(),
          ),
          GoRoute(
            name: Routes.nested_scroll_view_page.name,
            path: Routes.nested_scroll_view_page.name,
            builder: (context, state) => NestedScrollViewPage(),
          ),
          GoRoute(
            name: Routes.claude_list_page.name,
            path: Routes.claude_list_page.name,
            builder: (context, state) => const ClaudeListPage(),
          ),
          GoRoute(
              path: Routes.photo_list_page.name,
              name: Routes.photo_list_page.name,
              builder: (context, state) {
                return const PhotoListPage();
              }),
        ]),
  ],
);

enum Routes {
  draw_page,
  nested_scroll_view_page,
  claude_list_page,
  photo_list_page;
}
