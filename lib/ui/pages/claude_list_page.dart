import 'package:flutter/material.dart';

class ClaudeListPage extends StatelessWidget {
  const ClaudeListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F5F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1F1F),
        foregroundColor: const Color(0xFFF8F5F2),
        title: const Text(
          'Claude Insights',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AI Capabilities & Features',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1F1F1F),
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Explore the powerful features that make Claude your intelligent assistant',
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6B7280),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            ..._buildFeatureCards(),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildFeatureCards() {
    final features = [
      {
        'icon': Icons.psychology,
        'title': 'Advanced Reasoning',
        'description': 'Complex problem-solving with logical thinking and analysis',
        'color': const Color(0xFF6366F1),
      },
      {
        'icon': Icons.code,
        'title': 'Code Generation',
        'description': 'Write, debug, and optimize code across multiple languages',
        'color': const Color(0xFF10B981),
      },
      {
        'icon': Icons.chat_bubble_outline,
        'title': 'Natural Conversation',
        'description': 'Engaging dialogue with context-aware responses',
        'color': const Color(0xFF8B5CF6),
      },
      {
        'icon': Icons.school,
        'title': 'Educational Support',
        'description': 'Learning assistance across various subjects and levels',
        'color': const Color(0xFF06B6D4),
      },
      {
        'icon': Icons.create,
        'title': 'Creative Writing',
        'description': 'Generate stories, articles, and creative content',
        'color': const Color(0xFF3B82F6),
      },
      {
        'icon': Icons.analytics,
        'title': 'Data Analysis',
        'description': 'Process and interpret data with insightful observations',
        'color': const Color(0xFF8B5CF6),
      },
      {
        'icon': Icons.translate,
        'title': 'Language Translation',
        'description': 'Translate between languages while preserving meaning',
        'color': const Color(0xFF10B981),
      },
      {
        'icon': Icons.security,
        'title': 'Ethical AI',
        'description': 'Built with strong safety measures and ethical guidelines',
        'color': const Color(0xFF6366F1),
      },
    ];

    return features.map((feature) => _FeatureCard(
      icon: feature['icon'] as IconData,
      title: feature['title'] as String,
      description: feature['description'] as String,
      color: feature['color'] as Color,
    )).toList();
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.color,
  });

  final IconData icon;
  final String title;
  final String description;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 0,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: BorderSide(
            color: const Color(0xFFE5E7EB),
            width: 1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF1F1F1F),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF6B7280),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}