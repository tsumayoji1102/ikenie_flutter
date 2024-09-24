import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ikenie_flutter/ui/tab/syncfusion_calendar.dart';
import 'package:ikenie_flutter/ui/tab/tabs_enum.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentTab = useState<Tabs>(Tabs.listsView);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(currentTab.value.title),
      ),
      body: IndexedStack(
        index: currentTab.value.index,
        children: Tabs.values.map((tab) => tab.view).toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab.value.index,
        items: Tabs.values.map((tab) => tab.item).toList(),
        onTap: (value) => currentTab.value = Tabs.values[value],
      ),
    );
  }
}
