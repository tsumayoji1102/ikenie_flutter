import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ikenie_flutter/ui/router/router_setting.dart';

class RouterView extends StatelessWidget {
  const RouterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          children: Routes.values
              .map((route) => _ListTile(
                    title: route.name,
                    onTap: () => context.pushNamed(route.name),
                  ))
              .toList(),
        ));
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}
