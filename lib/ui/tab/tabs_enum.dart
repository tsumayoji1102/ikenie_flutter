import 'package:flutter/material.dart';
import 'package:ikenie_flutter/ui/tab/keyboard_actions.dart';
import 'package:ikenie_flutter/ui/tab/lists_view.dart';
import 'package:ikenie_flutter/ui/tab/syncfusion_calendar.dart';
import 'package:ikenie_flutter/ui/tab/text_view.dart';

enum Tabs {
  calendar,
  keyboard,
  textView,
  listsView;

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
        return const ListsView();
    }
  }

  BottomNavigationBarItem get item {
    const iconColor = Colors.black45;
    switch (this) {
      case Tabs.calendar:
        return BottomNavigationBarItem(
            icon: Icon(
              Icons.calendar_month,
              color: iconColor,
            ),
            label: this.name);
      case Tabs.keyboard:
        return BottomNavigationBarItem(
            icon: Icon(
              Icons.keyboard,
              color: iconColor,
            ),
            label: 'Keyboard');
      case Tabs.textView:
        return BottomNavigationBarItem(
            icon: Icon(
              Icons.text_fields,
              color: iconColor,
            ),
            label: 'Text View');
      case Tabs.listsView:
        return BottomNavigationBarItem(
          icon: Icon(
            Icons.list,
            color: iconColor,
          ),
          label: 'Lists',
        );
    }
  }
}
