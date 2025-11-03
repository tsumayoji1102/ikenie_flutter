import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:ikenie_flutter/main.dart';
import 'package:ikenie_flutter/ui/pages/draggable_scroll_page.dart';
import 'package:ikenie_flutter/ui/pages/firebase_riverpod_page.dart';
import 'package:ikenie_flutter/ui/pages/nested_scroll_view_page.dart';
import 'package:ikenie_flutter/ui/pages/photo_list_page.dart';
import 'package:ikenie_flutter/ui/pages/photos_page.dart';
import 'package:ikenie_flutter/ui/pages/claude_list_page.dart';
import 'package:ikenie_flutter/ui/pages/pinput_page.dart';

final routerConfig = GoRouter(
  initialLocation: "/",
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MyHomePage(),
      routes: Routes.values.map((route) => route.goRoute).toList(),
    ),
  ],
);

enum Routes {
  draw_page,
  nested_scroll_view_page,
  claude_list_page,
  photo_list_page,
  pinput_page,
  firebase_and_riverpod_page,
  draggable_scroll_page;

  GoRoute get goRoute => GoRoute(name: name, path: name, builder: view);

  Widget view(BuildContext context, GoRouterState state) => switch (this) {
    Routes.draw_page => const DrawPage(),
    Routes.nested_scroll_view_page => const NestedScrollViewPage(),
    Routes.claude_list_page => const ClaudeListPage(),
    Routes.photo_list_page => const PhotoListPage(),
    Routes.pinput_page => const PinputPage(),
    Routes.firebase_and_riverpod_page => const FirebaseRiverpodPage(),
    Routes.draggable_scroll_page => const DraggableScrollPage(),
  };
}
