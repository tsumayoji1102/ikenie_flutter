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
            ...Routes.values
                .map((route) => _ListTile(
                      title: _getDisplayTitle(route.name),
                      onTap: () => context.pushNamed(route.name),
                      isClaudeScreen: route.name == 'claude_list_page',
                    ))
                .toList(),
          ],
        ));
  }

  String _getDisplayTitle(String routeName) {
    switch (routeName) {
      case 'draw_page':
        return 'Drawing Canvas';
      case 'nested_scroll_view_page':
        return 'Nested Scroll View';
      case 'claude_list_page':
        return 'Claude Insights';
      default:
        return routeName.replaceAll('_', ' ').toUpperCase();
    }
  }
}

class _ListTile extends StatelessWidget {
  const _ListTile({
    super.key, 
    required this.title, 
    required this.onTap,
    this.isClaudeScreen = false,
  });

  final String title;
  final VoidCallback onTap;
  final bool isClaudeScreen;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: BorderSide(
            color: isClaudeScreen 
                ? const Color(0xFF6366F1) 
                : const Color(0xFFE5E7EB),
            width: isClaudeScreen ? 2 : 1,
          ),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20, 
            vertical: 8,
          ),
          title: Row(
            children: [
              if (isClaudeScreen)
                Container(
                  margin: const EdgeInsets.only(right: 12),
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF6366F1).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.psychology,
                    color: Color(0xFF6366F1),
                    size: 20,
                  ),
                ),
              Text(
                title,
                style: TextStyle(
                  fontWeight: isClaudeScreen ? FontWeight.w600 : FontWeight.w500,
                  color: isClaudeScreen 
                      ? const Color(0xFF6366F1) 
                      : const Color(0xFF1F1F1F),
                  fontSize: 16,
                ),
              ),
            ],
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: isClaudeScreen 
                ? const Color(0xFF6366F1) 
                : const Color(0xFF9CA3AF),
          ),
          onTap: onTap,
        ),
      ),
    );
  }
}
