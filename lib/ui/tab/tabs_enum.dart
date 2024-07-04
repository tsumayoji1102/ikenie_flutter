import 'package:flutter/material.dart';
import 'package:ikenie_flutter/ui/tab/keyboard_actions.dart';
import 'package:ikenie_flutter/ui/tab/syncfusion_calendar.dart';

enum Tabs {
  calendar,
  keyboard;

  String get title {
    switch (this) {
      case Tabs.calendar:
        return 'Calendar';
      case Tabs.keyboard:
        return 'Keyboard';
    }
  }

  Widget get view {
    switch (this) {
      case Tabs.calendar:
        return SyncFusionCalendarView();
      case Tabs.keyboard:
        return const KeyboardActionsView();
    }
  }

  BottomNavigationBarItem get item {
    switch (this) {
      case Tabs.calendar:
        return const BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month), label: 'Calendar');
      case Tabs.keyboard:
        return const BottomNavigationBarItem(
            icon: Icon(Icons.keyboard), label: 'Keyboard');
    }
  }
}
