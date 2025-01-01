import 'package:flutter/material.dart';
import 'package:ikenie_flutter/ui/tab/keyboard_actions.dart';
import 'package:ikenie_flutter/ui/tab/lists_view.dart';
import 'package:ikenie_flutter/ui/tab/nested_scroll_view.dart';
import 'package:ikenie_flutter/ui/tab/router_view.dart';
import 'package:ikenie_flutter/ui/tab/syncfusion_calendar.dart';
import 'package:ikenie_flutter/ui/tab/text_view.dart';

enum Tabs {
  calendar,
  keyboard,
  textView,
  listsView,
  sliverCheckView,
  routerView;

  String get title {
    switch (this) {
      case Tabs.calendar:
        return 'Calendar';
      case Tabs.keyboard:
        return 'Keyboard';
      case Tabs.textView:
        return 'Text View';
      case Tabs.listsView:
        return 'Lists View';
      case Tabs.sliverCheckView:
        return 'Nested Scroll View';
      case Tabs.routerView:
        return 'Router View';
    }
  }

  Widget get view {
    switch (this) {
      case Tabs.calendar:
        return SyncFusionCalendarView();
      case Tabs.keyboard:
        return const KeyboardActionsView();
      case Tabs.textView:
        return const TextView();
      case Tabs.listsView:
        return ListsView();
      case Tabs.sliverCheckView:
        return const SliverCheckView();
      case Tabs.routerView:
        return const RouterView();
    }
  }

  BottomNavigationBarItem get item {
    const iconColor = Colors.black45;
    switch (this) {
      case Tabs.calendar:
        return BottomNavigationBarItem(
            icon: const Icon(
              Icons.calendar_month,
              color: iconColor,
            ),
            label: name);
      case Tabs.keyboard:
        return const BottomNavigationBarItem(
            icon: Icon(
              Icons.keyboard,
              color: iconColor,
            ),
            label: 'Keyboard');
      case Tabs.textView:
        return const BottomNavigationBarItem(
            icon: Icon(
              Icons.text_fields,
              color: iconColor,
            ),
            label: 'Text View');
      case Tabs.listsView:
        return const BottomNavigationBarItem(
          icon: Icon(
            Icons.list,
            color: iconColor,
          ),
          label: 'Lists',
        );
      case Tabs.sliverCheckView:
        return const BottomNavigationBarItem(
          icon: Icon(
            Icons.view_agenda,
            color: iconColor,
          ),
          label: 'Nested Scroll View',
        );
      case Tabs.routerView:
        return const BottomNavigationBarItem(
          icon: Icon(
            Icons.router,
            color: iconColor,
          ),
          label: 'Router View',
        );
    }
  }
}
