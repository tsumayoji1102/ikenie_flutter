import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ikenie_flutter/ui/router/router_setting.dart';

extension RouterViewExtension on Routes {
  String get displayTitle => name.replaceAll('_', ' ').toUpperCase();
}

class RouterView extends StatelessWidget {
  const RouterView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Available Screens',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1F1F1F),
                ),
              ),
            ),
            ...Routes.values.map(
              (route) => _ListTile(
                title: route.displayTitle,
                onTap: () => context.pushNamed(route.name),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: const Color(0xFFE5E7EB)),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          title: Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF1F1F1F),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Color(0xFF9CA3AF),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
